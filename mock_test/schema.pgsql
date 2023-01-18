
/*
Consider the following database schema consisting of two relations.

The Students relation stores information about students (identified by sid).

The Presenters relation maintains information about students who have presented tutorial questions.
Specifically, a tuple (wk,qnum,sid) in Presenters relation 
means that the student identified by sid presented tutorial question number qnum in week wk.
For each week, a student can present at most one question.

Assume that if the maximum week value in Presenters relation is W,
then there is at least one record in Presenters for each week value from  {1, 2, ..., W},
and the next tutorial class will be in week W+1.
*/

drop table if exists Presenters, Students cascade;

create table Students (
	sid 	integer primary key
);

create table Presenters (
	week 	integer check (week > 0),
	sid 	integer references Students,
	qnum 	integer not null check (qnum > 0),
	primary key (week, sid)
);


