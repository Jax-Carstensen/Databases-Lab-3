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
);
create table Supervises(
	StudentSSN varchar(10),
	ProjNumber int,
	foreign key(StudentSSN) references Students(SSN),
	foreign key(ProjNumber) references Projects(ProjectNumber)
);
create table CoInvestigators(
	ProfessorSSN varchar(10),
	ProjNumber int,
	foreign key(ProfessorSSN) references Professors(SSN),
	foreign key(ProjNumber) references Projects(ProjectNumber)
);
-- Insert the students
insert into Students values('12345678', 'Ph.D.', '02/05/2001', 'John Mayor');
insert into Students values('23456789', 'M.S.', '03/07/2002', 'Earl Diggins');
insert into Students values('23456781', 'Ph.D.', '02/05/2001', 'Nathan Digby');
insert into Students values('62346723', 'Ph.D.', '10/23/1996', 'Madison Smith');
insert into Students values('979267592', 'Ph.D.', '01/27/2004', 'Daniel Digby');
insert into Students values('236714723', 'M.S.', '07/16/1999', 'Ethan Nelson');
insert into Students values('834357372', 'M.S.', '05/30/2000', 'Jacob Johnson');

-- Insert the professors
insert into Professors values('505025235', 'Computer Science', 1, 'Kaleb Melbourne', '05/24/1985');
insert into Professors values('510526736', 'Math', 2, 'Gage Smith', '11/05/1967');
insert into Professors values('12602672', 'Computer Science', 2, 'Megan Fox', '06/12/1988');

-- Insert the projects
insert into Projects values(1, 'Coca Cola', '01/01/2021', '12/31/2021', 50000);
insert into Projects values(2, 'Pepsi', '02/15/2021', '02/15/2022', 100000);
insert into Projects values(3, 'Walmart', '08/01/2020', '08/01/2021', 25000);

-- Insert the departments
insert into Departments values(1, 'f-21', 'Computer Science');
insert into Departments values(2, 'b-12', 'Math');
insert into Departments values(3, 'f-20', 'English');
insert into Departments values(4, 'f-19', 'Art');

-- Insert WorksIn
insert into WorksIn values('505025235', 1, 25);
insert into WorksIn values('510526736', 2, 25);
insert into WorksIn values('12602672', 4, 25);

-- Insert into Manages
insert into Manages values(1, '505025235');
insert into Manages values(2, '12602672');
insert into Manages values(3, '510526736');

-- Insert into Chairmen
insert into Chairman values(1, '510526736');
insert into Chairman values(2, '505025235');
insert into Chairman values(3, '12602672');

-- Insert into Major Departments
insert into MajorDepartments values('12345678', 1);
insert into MajorDepartments values('23456789', 3);
insert into MajorDepartments values('23456781', 2);
insert into MajorDepartments values('62346723', 2);
insert into MajorDepartments values('979267592', 4);
insert into MajorDepartments values('236714723', 3);
insert into MajorDepartments values('834357372', 1);

-- Insert into Student Advisors
insert into StudentAdvisors values('12345678', '23456789');
insert into StudentAdvisors values('23456789', '23456781');
insert into StudentAdvisors values('23456781', '62346723');
insert into StudentAdvisors values('62346723', '979267592');
insert into StudentAdvisors values('979267592', '236714723');
insert into StudentAdvisors values('236714723', '834357372');
insert into StudentAdvisors values('834357372', '12345678');

-- Insert into Research Assistants
insert into ResearchAssistants values('12345678', 1);
insert into ResearchAssistants values('23456789', 3);
insert into ResearchAssistants values('23456781', 2);
insert into ResearchAssistants values('62346723', 3);
insert into ResearchAssistants values('979267592', 2);
insert into ResearchAssistants values('236714723', 1);
insert into ResearchAssistants values('834357372', 3);

-- Insert into Supervises
insert into Supervises values('12345678', 1);
insert into Supervises values('23456781', 2);
insert into Supervises values('979267592', 3);

-- Insert into Co-Investigators
insert into CoInvestigators values('505025235', 1);
insert into CoInvestigators values('510526736', 2);
insert into CoInvestigators values('12602672', 3);

--The total budget for all projects
select sum(budget) from Projects;

--Professors who manage projects
select ProfName from Professors p where exists(select * from Manages where p.SSN = ProfessorSSN);

--Professors who do not manage projects
select ProfName from Professors p where not exists(select * from Manages where p.SSN = ProfessorSSN);


/*
Which graduate student work on3 or more projects?
What are the professors that work in each department?
*/
