-- Load data for testcase 3

DELETE FROM Transcripts;
DELETE FROM Tutors;
DELETE FROM Teaches;
DELETE FROM Offerings;
DELETE FROM Courses;
DELETE FROM Profs;
DELETE FROM Students;
DELETE FROM Departments;




INSERT INTO departments (did, faculty) VALUES 
('maths','fos'),
('cs','soc')
;

INSERT INTO students (sid, did, year) VALUES 
('alice','cs',2020),
('carol','cs',2018),
('bob','cs',2019),
('dave','cs',2019),
('eve','cs',2021),
('fred','cs',2018)
;

INSERT INTO profs (pid, did) VALUES 
('homer','cs'),
('maggie','cs')
;

INSERT INTO courses (cid, did, credits) VALUES 
('cs1','cs',5),
('cs2','cs',5),
('cs3','cs',5),
('cs4','cs',5)
;

INSERT INTO offerings (cid, year, semester) VALUES 
('cs1',2019,2),
('cs1',2020,2),
('cs1',2021,2),
('cs2',2020,2),
('cs2',2021,2),
('cs3',2020,2),
('cs4',2020,2),
('cs4',2021,2)
;

INSERT INTO teaches (pid, cid, year, semester, hours) VALUES 
('homer','cs1',2019,2,30),
('homer','cs1',2020,2,30),
('homer','cs1',2021,2,30),
('maggie','cs2',2020,2,30),
('maggie','cs2',2021,2,30),
('homer','cs3',2020,2,30),
('maggie','cs4',2020,2,30),
('maggie','cs4',2021,2,30)
;

INSERT INTO transcripts (sid, cid, year, semester, marks) VALUES 
('fred','cs1',2019,2,40),
('fred','cs1',2020,2,40),
('alice','cs1',2020,2,40),
('carol','cs1',2021,2,60),
('eve','cs1',2021,2,60),
('fred','cs1',2021,2,40),
('alice','cs2',2020,2,90),
('fred','cs2',2020,2,40),
('eve','cs2',2021,2,50),
('fred','cs2',2021,2,40),
('fred','cs4',2020,2,40),
('fred','cs4',2021,2,40),
('eve','cs4',2021,2,90),
('alice','cs3',2020,2,90),
('bob','cs1',2021,2,70),
('fred','cs3',2020,2,40)
;


