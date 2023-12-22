create database day1;
use day1;
create table Department(
	DepartmentID int primary key auto_increment,
    DepartmentName nvarchar(50)
);
create table Positions(
	PositionID int primary key auto_increment,
	PositionName enum('Dev','Test','Scrum Master','PM')
);
create table Accounts(
	AccountID int primary key auto_increment,
    Email varchar(30),
    Username varchar(50),
    FullName nvarchar(50),
    DepartmentID int,
    PositionID int,
    CreateDate date,
	foreign key(DepartmentID) references Department(DepartmentID),
	foreign key(PositionID) references Positions(PositionID)
);
create table Groupp(
	GroupID int primary key auto_increment,
    GroupName nvarchar(50),
    CreatorID varchar(10),
    CreateDate date
);
create table GroupAccount(
	GroupID int,
    ACcountID int,
	foreign key(GroupID) references Groupp(GroupID),
    foreign key(AccountID) references Accounts(AccountID),
    JoinDate date
);
create table TypeQuestion(
	TypeID int primary key auto_increment,
    TypeName enum('Essay','Multiple-Choice')
);
create table CategoryQuestion(
	CategoryID int  primary key auto_increment,
    CategoryName varchar(50)
);
create table Question(
	QuestionID int primary key auto_increment,
    Content nvarchar(50),
    CategoryID int,
    TypeID int,
    foreign key(CategoryID) references CategoryQuestion(CategoryID),
    foreign key(TypeID) references TypeQuestion(TypeID),
	CreatorID varchar(10),
    CreateDate date
);
create table Answer(
	AnswerID int primary key auto_increment,
    Content nvarchar(50),
    QuestionID int,
    foreign key(QuestionID) references Question(QuestionID),
    isCorrect bit
);
create table Exam(
	ExamID int primary key auto_increment,
    CodeID varchar(10),
    Title nvarchar(50),
    CategoryID int,
    foreign key(CategoryID) references CategoryQuestion(CategoryID),
    Duration nvarchar(50),
    CreatorID varchar(10),
    CreateDate date
);
create table ExamQuestion(
	ExamID int,
	QuestionID int,
	foreign key(ExamID) references Exam(ExamID),
    foreign key(QuestionID) references Question(QuestionID)
);
select* from Department;
select* from Positions;
select* from Accounts;
select* from Groupp;
select* from GroupAccount;
select* from TypeQuestion;
select* from CategoryQuestion;
select* from Question;
select* from Answer;
select* from Exam;
select* from ExamQuestion;