[CmdletBinding()]
param(
    [string]$InputPath = (Join-Path $PSScriptRoot 'facebook_combined.txt'),
    [string]$OutputDirectory = $PSScriptRoot
)

$ErrorActionPreference = 'Stop'
$resolvedInputPath = (Resolve-Path -LiteralPath $InputPath).Path
$resolvedOutputDirectory = [System.IO.Path]::GetFullPath($OutputDirectory)
[void][System.IO.Directory]::CreateDirectory($resolvedOutputDirectory)

$nodes = [System.Collections.Generic.HashSet[int]]::new()
$edges = [System.Collections.Generic.HashSet[string]]::new()
$edgesPath = Join-Path $resolvedOutputDirectory 'facebook_edges.csv'
$nodesPath = Join-Path $resolvedOutputDirectory 'facebook_nodes.csv'
$temporaryEdgesPath = "$edgesPath.tmp"
$temporaryNodesPath = "$nodesPath.tmp"
$reader = $null
$edgesWriter = $null
$nodesWriter = $null
$completed = $false

try {
    $reader = [System.IO.StreamReader]::new($resolvedInputPath)
    $edgesWriter = [System.IO.StreamWriter]::new(
        $temporaryEdgesPath,
        $false,
        [System.Text.UTF8Encoding]::new($false)
    )
    $edgesWriter.WriteLine('source,target')

    $lineNumber = 0
    while ($null -ne ($line = $reader.ReadLine())) {
        $lineNumber++
        if ($line -notmatch '^\s*(\d+)\s+(\d+)\s*$') {
            throw "Invalid edge format on line $lineNumber."
        }

        $source = [int]::Parse($Matches[1])
        $target = [int]::Parse($Matches[2])
        if ($source -eq $target) {
            throw "Self-loop found on line $lineNumber."
        }

        $lowerId = [Math]::Min($source, $target)
        $higherId = [Math]::Max($source, $target)
        if (-not $edges.Add("${lowerId}:${higherId}")) {
            throw "Duplicate undirected edge found on line $lineNumber."
        }

        [void]$nodes.Add($source)
        [void]$nodes.Add($target)
        $edgesWriter.WriteLine("$source,$target")
    }

    $reader.Dispose()
    $reader = $null
    $edgesWriter.Dispose()
    $edgesWriter = $null

    $nodesWriter = [System.IO.StreamWriter]::new(
        $temporaryNodesPath,
        $false,
        [System.Text.UTF8Encoding]::new($false)
    )
    $nodesWriter.WriteLine('id')
    foreach ($nodeId in ($nodes | Sort-Object)) {
        $nodesWriter.WriteLine($nodeId)
    }
    $nodesWriter.Dispose()
    $nodesWriter = $null

    Move-Item -LiteralPath $temporaryEdgesPath -Destination $edgesPath -Force
    Move-Item -LiteralPath $temporaryNodesPath -Destination $nodesPath -Force
    $completed = $true

    [PSCustomObject]@{
        InputFile = $resolvedInputPath
        NodeCount = $nodes.Count
        EdgeCount = $edges.Count
        NodesFile = $nodesPath
        EdgesFile = $edgesPath
    }
}
finally {
    if ($null -ne $reader) { $reader.Dispose() }
    if ($null -ne $edgesWriter) { $edgesWriter.Dispose() }
    if ($null -ne $nodesWriter) { $nodesWriter.Dispose() }
    if (-not $completed) {
        Remove-Item -LiteralPath $temporaryEdgesPath, $temporaryNodesPath -Force -ErrorAction SilentlyContinue
    }
}