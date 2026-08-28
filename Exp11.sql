
CREATE KEYSPACE IF NOT EXISTS library
WITH REPLICATION = {
  'class': 'SimpleStrategy',
  'replication_factor': 3
};

USE library;

CREATE TABLE IF NOT EXISTS authors (
    AuthorID int PRIMARY KEY,
    FirstName text,
    LastName text
);

INSERT INTO authors (AuthorID, FirstName, LastName)
VALUES (1, 'George', 'Orwell');

INSERT INTO authors (AuthorID, FirstName, LastName)
VALUES (2, 'Aldous', 'Huxley');

INSERT INTO authors (AuthorID, FirstName, LastName)
VALUES (3, 'J.K.', 'Rowling');

SELECT * FROM authors;


UPDATE authors
SET LastName = 'Smith'
WHERE AuthorID = 1;

SELECT * FROM authors
WHERE AuthorID = 1;


DELETE FROM authors
WHERE AuthorID = 1;


SELECT * FROM authors
WHERE AuthorID = 1;