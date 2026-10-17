// Verify imported dataset size.
MATCH (person:Person)
RETURN count(person) AS people;

MATCH ()-[friendship:FRIEND]-()
RETURN count(DISTINCT friendship) AS friendships;

// Find the 10 people with the most direct connections.
MATCH (person:Person)-[:FRIEND]-(friend:Person)
RETURN person.id AS userId,
       count(DISTINCT friend) AS degree
ORDER BY degree DESC
LIMIT 10;

// Recommend up to 10 friends for user 107 by mutual-friend count.
MATCH (person:Person {id: 107})-[:FRIEND]-(mutual:Person)-[:FRIEND]-(candidate:Person)
WHERE candidate <> person
OPTIONAL MATCH (person)-[direct:FRIEND]-(candidate)
WITH mutual, candidate, direct
WHERE direct IS NULL
RETURN candidate.id AS suggestedUser,
       count(DISTINCT mutual) AS mutualFriends
ORDER BY mutualFriends DESC
LIMIT 10;

// Inspect all mutual friends between users 107 and 513.
MATCH (:Person {id: 107})-[:FRIEND]-(mutual:Person)-[:FRIEND]-(:Person {id: 513})
RETURN DISTINCT mutual.id AS mutualFriend;

// Verify that users 107 and 513 are not directly connected.
MATCH (person:Person {id: 107})
OPTIONAL MATCH (person)-[direct:FRIEND]-(:Person {id: 513})
RETURN count(direct) AS directFriendships;

// Visualize the direct neighborhood of user 107 in Memgraph Lab.
MATCH path = (:Person {id: 107})-[:FRIEND]-(friend:Person)
RETURN path
LIMIT 100;