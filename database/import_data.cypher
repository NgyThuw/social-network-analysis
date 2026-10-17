// Import nodes before relationships.
LOAD CSV FROM "/usr/lib/memgraph/facebook_nodes.csv" WITH HEADER AS row
MERGE (:Person {id: toInteger(row.id)});

// Each SNAP row represents one undirected friendship.
// Store the row's source-to-target orientation once; query FRIEND as undirected.
LOAD CSV FROM "/usr/lib/memgraph/facebook_edges.csv" WITH HEADER AS row
MATCH (source:Person {id: toInteger(row.source)})
MATCH (target:Person {id: toInteger(row.target)})
MERGE (source)-[:FRIEND]->(target);