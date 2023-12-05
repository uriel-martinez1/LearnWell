USE master
GO

--drop database if it exists
IF DB_ID('final_capstone') IS NOT NULL
BEGIN
	ALTER DATABASE final_capstone SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE final_capstone;
END

CREATE DATABASE final_capstone
GO

USE final_capstone
GO

--create tables
CREATE TABLE users (
	user_id int IDENTITY(1,1) NOT NULL,
	first_name nvarchar(50) NOT NULL,
	last_name nvarchar(50) NOT NULL,
	username nvarchar(50) NOT NULL UNIQUE,
	password_hash nvarchar(200) NOT NULL,
	salt nvarchar(200) NOT NULL,
	user_role nvarchar(50) NOT NULL,
	isTeacher BIT DEFAULT 0,
	isAdmin BIT DEFAULT 0,
	isActive BIT default 1,
	created_date DATETIME DEFAULT GETUTCDATE(),
	last_updated DATETIME NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id),
	CONSTRAINT CHK_user_role CHECK (user_role = 'student' OR user_role = 'teacher' OR user_role = 'admin'),
)

GO

CREATE TABLE courses (
	course_id int IDENTITY (1,1) NOT NULL,
	teacher_id int NOT NULL,
	course_name nvarchar(250) NOT NULL UNIQUE,
	description nvarchar(max) NOT NULL,
	difficulty int NOT NULL ,
	cost money DEFAULT 0.00,
	created_date DATETIME DEFAULT GETUTCDATE(),
	last_updated DATETIME NULL,
	isActive BIT DEFAULT 1,
	CONSTRAINT PK_course PRIMARY KEY (course_id),
	CONSTRAINT CHK_difficulty CHECK (difficulty >=1 AND difficulty <= 10),
)

GO

CREATE TABLE courses_students (
	id int IDENTITY (1,1) NOT NULL,
	course_id int NOT NULL,
	student_id int NOT NULL,
	created_date DATETIME DEFAULT GETUTCDATE(),
	isActive BIT DEFAULT 1,
	CONSTRAINT PK_id PRIMARY KEY (id),
	CONSTRAINT FK_courses_students_course_id FOREIGN KEY (course_id) REFERENCES courses(course_id),
	CONSTRAINT FK_courses_students_student_id FOREIGN KEY (student_id) REFERENCES users(user_id)
)

GO

CREATE TABLE curriculum_elements(
	curriculum_element_id int IDENTITY (1,1) NOT NULL,
	course_id int NOT NULL,
	course_order int NOT NULL,
	description nvarchar(250) NOT NULL,
	lecture_content nvarchar(max),
	created_date DATETIME DEFAULT GETUTCDATE(),
	last_updated DATETIME NULL,
	isActive BIT DEFAULT 1,
	CONSTRAINT PK_curriculum_element_id PRIMARY KEY (curriculum_element_id),
	CONSTRAINT FK_curriculum_elements_course_id FOREIGN KEY (course_id) REFERENCES courses(course_id),
)

GO

CREATE TABLE sources (
	source_id int IDENTITY (1,1) NOT NULL,
	curriculum_element_id INT NOT NULL,
	source_url nvarchar(250),
	created_date DATETIME DEFAULT GETUTCDATE(),
	last_updated DATETIME NULL,
	isActive BIT DEFAULT 1,
	CONSTRAINT PK_source_id PRIMARY KEY (source_id),
	CONSTRAINT FK_sources_curriculum_element_id FOREIGN KEY (curriculum_element_id) REFERENCES curriculum_elements(curriculum_element_id),
)

GO

CREATE TABLE assignments (
	assignment_id int IDENTITY (1,1) NOT NULL,
	curriculum_element_id int NOT NULL,
	title nvarchar(50) NOT NULL,
	description nvarchar(250) NOT NULL,
	assignment_type nvarchar(50) NOT NULL,
	created_date DATETIME DEFAULT GETUTCDATE(),
	last_updated DATETIME NULL,
	isActive BIT DEFAULT 1,
	CONSTRAINT PK_assignment_id PRIMARY KEY (assignment_id),
	CONSTRAINT FK_assignments_curriculum_element_id FOREIGN KEY (curriculum_element_id) REFERENCES curriculum_elements(curriculum_element_id),
	CONSTRAINT CHK_type CHECK (assignment_type = 'homework' OR assignment_type = 'quiz' OR assignment_type = 'test' OR assignment_type = 'extra' OR assignment_type = 'essay')
)

GO

CREATE TABLE questions (
	question_id int IDENTITY (1,1) NOT NULL,
	prompt nvarchar(max) NOT NULL,
	question_type nvarchar(50) NOT NULL,
	answer_1 nvarchar(max) NULL,
	answer_2 nvarchar(max) NULL,
	answer_3 nvarchar(max) NULL,
	answer_4 nvarchar(max) NULL,
	correct_choice_answer int NULL,
	created_date DATETIME DEFAULT GETUTCDATE(),
	last_updated DATETIME NULL,
	isActive BIT DEFAULT 1,
	CONSTRAINT PK_question_id PRIMARY KEY (question_id),
	CONSTRAINT CHK_questions_question_type CHECK (question_type = 'choice' OR question_type = 'text' OR question_type = 'external'),
	CONSTRAINT CHK_questions_correct_choice_answer CHECK (correct_choice_answer >= 1 AND correct_choice_answer <= 4)
)

GO

CREATE TABLE assignments_questions (
	assignments_questions_id int IDENTITY (1,1) NOT NULL,
	assignment_id int NOT NULL,
	question_id int NOT NULL,
	CONSTRAINT PK_assignments_questions_id PRIMARY KEY (assignments_questions_id),
	CONSTRAINT FK_assignments_questions_assignment_id FOREIGN KEY (assignment_id) REFERENCES assignments(assignment_id),
	CONSTRAINT FK_assignments_questions_question_id FOREIGN KEY (question_id) REFERENCES questions(question_id),
)

GO

CREATE TABLE submitted_assignments(
	submitted_assignment_id int IDENTITY (1,1) NOT NULL,
	assignment_id int NOT NULL,
	student_id int NOT NULL,
	teacher_id int NOT NULL,
	course_id int NOT NULL,
	score int DEFAULT 0 NOT NULL,
	graded_date DATETIME NULL,
	created_date DATETIME DEFAULT GETUTCDATE(),
	CONSTRAINT PK_submitted_assignment_id PRIMARY KEY (submitted_assignment_id),
	CONSTRAINT FK_submitted_assignments_assignment_id FOREIGN KEY (assignment_id) REFERENCES assignments(assignment_id),
	CONSTRAINT FK_submitted_assignments_student_id FOREIGN KEY (student_id) REFERENCES users(user_id),
	CONSTRAINT FK_submitted_assignments_teacher_id FOREIGN KEY (teacher_id) REFERENCES users(user_id),
)

GO

CREATE TABLE answers(
	answer_id int IDENTITY (1,1) NOT NULL,
	submitted_assignment_id int NOT NULL,
	question_type nvarchar(50) NOT NULL,
	answer_choice int NULL,
	answer_text nvarchar(max) NULL,
	answer_external nvarchar(max) NULL,
	isCorrect BIT DEFAULT 0,
	last_updated DATETIME NULL,
	number_of_edits int DEFAULT 0,
	CONSTRAINT PK_answer_id PRIMARY KEY (answer_id),
	CONSTRAINT FK_answers_submitted_assignment_id FOREIGN KEY (submitted_assignment_id) REFERENCES submitted_assignments(submitted_assignment_id),
	CONSTRAINT CHK_answers_question_type CHECK (question_type = 'choice' OR question_type = 'text' OR question_type = 'external'),
	CONSTRAINT CHK_answers_answer_choice CHECK (answer_choice >= 1 AND answer_choice <= 4)
)

GO

CREATE TABLE comments(
	comment_id int IDENTITY (1,1) NOT NULL,
	submitted_assignment_id int NOT NULL,
	created_by int NOT NULL,
	comment nvarchar(max) NOT NULL,
	created_date DATETIME DEFAULT GETUTCDATE(),
	last_updated DATETIME NULL,
	number_of_edits int DEFAULT 0,
	CONSTRAINT PK_comment_id PRIMARY KEY (comment_id),
	CONSTRAINT FK_comments_submitted_assignment_id FOREIGN KEY (submitted_assignment_id) REFERENCES submitted_assignments(submitted_assignment_id),
	CONSTRAINT FK_comments_created_by FOREIGN KEY (created_by) REFERENCES users(user_id),
)

GO
--populate default data