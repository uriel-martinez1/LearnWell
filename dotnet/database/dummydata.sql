-- Set identity insert on for users
SET IDENTITY_INSERT users ON;

INSERT INTO users (user_id, first_name, last_name, username, password_hash, salt, user_role, isTeacher, isAdmin, isActive, created_date, last_updated)
VALUES
(1, 'John', 'Doe', 'john.doe', 'hashed_password', 'salt_value', 'admin', 0, 1, 1, GETUTCDATE(), NULL),
(2, 'Jane', 'Doe', 'jane.doe', 'hashed_password', 'salt_value', 'teacher', 1, 0, 1, GETUTCDATE(), NULL),
(3, 'Alice', 'Johnson', 'alice.j', 'hashed_password', 'salt_value', 'student', 0, 0, 1, GETUTCDATE(), NULL),
(4, 'Bob', 'Smith', 'bob.smith', 'hashed_password', 'salt_value', 'student', 0, 0, 1, GETUTCDATE(), NULL);

SET IDENTITY_INSERT users OFF;

-- Populate courses table
INSERT INTO courses (teacher_id, course_name, description, difficulty, cost, created_date, last_updated, isActive)
VALUES
(2, 'Math 101', 'Introduction to Mathematics', 5, 0.00, GETUTCDATE(), NULL, 1),
(2, 'English 201', 'Advanced English Literature', 7, 0.00, GETUTCDATE(), NULL, 1);

-- Populate courses_students table
INSERT INTO courses_students (course_id, student_id, created_date, isActive)
VALUES
(1, 3, GETUTCDATE(), 1),
(2, 4, GETUTCDATE(), 1);

-- Populate curriculum_elements table
INSERT INTO curriculum_elements (course_id, course_order, description, lecture_content, created_date, last_updated, isActive)
VALUES
(1, 1, 'Introduction to Algebra', 'Algebra basics lecture', GETUTCDATE(), NULL, 1),
(1, 2, 'Advanced Calculus', 'Calculus principles lecture', GETUTCDATE(), NULL, 1),
(2, 1, 'Shakespearean Literature', 'Shakespearean plays lecture', GETUTCDATE(), NULL, 1);

-- Populate sources table
INSERT INTO sources (curriculum_element_id, source_url, created_date, last_updated, isActive)
VALUES
(1, 'https://example.com/algebra-lecture', GETUTCDATE(), NULL, 1),
(2, 'https://example.com/calculus-lecture', GETUTCDATE(), NULL, 1),
(3, 'https://example.com/shakespeare-lecture', GETUTCDATE(), NULL, 1);

-- Populate assignments table
INSERT INTO assignments (curriculum_element_id, title, description, assignment_type, created_date, last_updated, isActive)
VALUES
(1, 'Algebra Homework 1', 'Homework on algebra basics', 'homework', GETUTCDATE(), NULL, 1),
(2, 'Calculus Quiz 1', 'Quiz on calculus principles', 'quiz', GETUTCDATE(), NULL, 1),
(3, 'Shakespeare Essay', 'Essay on Shakespearean literature', 'essay', GETUTCDATE(), NULL, 1);

-- Populate questions table
INSERT INTO questions (prompt, question_type, answer_1, answer_2, answer_3, answer_4, correct_choice_answer, created_date, last_updated, isActive)
VALUES
('What is the solution to x + 3 = 7?', 'choice', '4', '6', '8', '10', 3, GETUTCDATE(), NULL, 1),
('What is the derivative of sin(x)?', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1),
('Who wrote the play "Hamlet"?', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1);

-- Populate assignments_questions table
INSERT INTO assignments_questions (assignment_id, question_id)
VALUES
(1, 1),
(2, 2),
(3, 3);

-- Populate submitted_assignments table
INSERT INTO submitted_assignments (assignment_id, student_id, teacher_id, course_id, score, graded_date, created_date)
VALUES
(1, 3, 2, 1, 95, GETUTCDATE(), GETUTCDATE()),
(2, 4, 2, 1, 80, GETUTCDATE(), GETUTCDATE()),
(3, 4, 2, 2, NULL, NULL, GETUTCDATE());

-- Populate answers table
INSERT INTO answers (submitted_assignment_id, question_type, answer_choice, answer_text, answer_external, isCorrect, last_updated, number_of_edits)
VALUES
(1, 'choice', 3, NULL, NULL, 1, NULL, 0),
(1, 'text', NULL, 'The derivative is cos(x).', NULL, 1, NULL, 0),
(2, 'choice', 2, NULL, NULL, 0, NULL, 0),
(2, 'text', NULL, 'The derivative is cos(x).', NULL, 1, NULL, 0);

-- Populate comments table
INSERT INTO comments (submitted_assignment_id, created_by, comment, created_date, last_updated, number_of_edits)
VALUES
(1, 2, 'Great work!', GETUTCDATE(), NULL, 0),
(1, 2, 'You missed a step in question 1.', GETUTCDATE(), NULL, 0),
(2, 2, 'Good effort!', GETUTCDATE(), NULL, 0),
(3, 2, 'Interesting perspective on Shakespeare!', GETUTCDATE(), NULL, 0);

-- Reset identity insert
SET IDENTITY_INSERT users OFF;