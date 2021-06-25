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
