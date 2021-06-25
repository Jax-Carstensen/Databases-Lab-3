/*
Co-Investigators
Supervise
*/
create table Professors(
	SSN varchar(10),
	Speciality varchar(20),
	ProfRank int,
	ProfName varchar(20),
	DOB date,
	primary key(SSN)
);

create table Projects(
	ProjectNumber int,
	SponsorName varchar(20),
	StartDate date,
	EndDate date,
	Budget int,
	primary key(ProjectNumber)
);

create table Departments(
	DeptNumber int,
	MainOffice varchar(20),
	DeptName varchar(20),
	primary key(DeptNumber)
);

create table Students(
	SSN varchar(10),
	DegreeProgram varchar(20),
	DOB date,
	StudentName varchar(20),
	primary key(SSN),
);

create table WorksIn(
	EmployeeSSN varchar(10),
	DepartmentNumber int,
	TimePercentage int,
	foreign key(EmployeeSSN) references Professors(SSN),
	foreign key(DepartmentNumber) references Departments(DeptNumber)
);
create table Manages(
	ProjNumber int,
	ProfessorSSN varchar(10),
	foreign key(ProjNumber) references Projects(ProjectNumber),
	foreign key(ProfessorSSN) references Professors(SSN)
);
create table Chairmen(
	ProjNumber int,
	ProfessorSSN varchar(10),
	foreign key(ProjNumber) references Projects(ProjectNumber),
	foreign key(ProfessorSSN) references Professors(SSN)
);
create table MajorDepartments(
	StudentSSN varchar(10),
	DepartmentNumber int,
	foreign key(StudentSSN) references Students(SSN),
	foreign key(DepartmentNumber) references Departments(DeptNumber)
);
create table StudentAdvisors(
	StudentSSN varchar(10),
	AdvisorSSN varchar(10),
	foreign key(StudentSSN) references Students(SSN),
	foreign key(StudentSSN) references Students(SSN)
);
create table ResearchAssistants(
	StudentSSN varchar(10),
	ProjNumber int,
	foreign key(StudentSSN) references Students(SSN),
	foreign key(ProjNumber) references Projects(ProjectNumber)
)
insert into Students values('12345678', 'Computer Science', '02/05/2001', 'John Mayor');
insert into Students values('23456789', 'Math', '03/07/2002', 'Earl Diggins');
insert into Students values('23456781', 'Computer Science', '02/05/2001', 'Nathan Digby');
insert into Students values('62346723', 'Science', '10/23/1996', 'Madison Smith');
insert into Students values('979267592', 'Math', '01/27/2004', 'Daniel Digby');
insert into Students values('236714723', 'Science', '07/16/1999', 'Ethan Nelson');
insert into Students values('834357372', 'Computer Science', '05/30/2000', 'Jacob Johnson');
select * from Students s where s.DOB >= '01/01/2001';
select * from WorksIn
/*
What is the total budget for all projects?
Who are the professors who manage projects?
Who are the professors who don’t manage projects?
Which graduate student work on3 or more projects?
What are the professors that work in each department?
*/
