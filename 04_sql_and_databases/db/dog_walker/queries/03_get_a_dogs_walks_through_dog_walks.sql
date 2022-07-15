-- SQLite - a dog has many walks, through dog_walks
SELECT walks.* FROM walks 
INNER JOIN dog_walks
ON dog_walks.walk_id = walks.id
WHERE dog_id = 2;