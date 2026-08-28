use library;

db.students.insertMany([
  { "StudentID": 1, "Name": "Ezhil", "Department": "IT", "Age": 20 },
  { "StudentID": 2, "Name": "Aarthi", "Department": "CSE", "Age": 21 },
  { "StudentID": 3, "Name": "Priya", "Department": "IT", "Age": 20 }
]);

db.students.find().pretty();

CREATE KEYSPACE IF NOT EXISTS library
WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1};

USE library;

CREATE TABLE IF NOT EXISTS students (
    StudentID int PRIMARY KEY,
    Name text,
    Department text,
    Age int
);

INSERT INTO students (StudentID, Name, Department, Age)
VALUES (1, 'Ezhil', 'IT', 20);
INSERT INTO students (StudentID, Name, Department, Age)
VALUES (2, 'Aarthi', 'CSE', 21);
INSERT INTO students (StudentID, Name, Department, Age)
VALUES (3, 'Priya', 'IT', 20);

SELECT * FROM students;

CREATE (a:Student {StudentID: 1, Name: 'Ezhil'});
CREATE (b:Student {StudentID: 2, Name: 'Aarthi'});
CREATE (a)-[:FRIEND]->(b);

MATCH (s:Student)-[r:FRIEND]->(t:Student)
RETURN s, r, t;
