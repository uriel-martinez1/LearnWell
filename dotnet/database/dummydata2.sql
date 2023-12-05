-- Set identity insert on for users
SET IDENTITY_INSERT users ON;

INSERT INTO users (user_id, first_name, last_name, email, username, password_hash, salt, user_role, isTeacher, isAdmin, isActive, created_date, last_updated)
VALUES
(1, 'John', 'Doe', 'john.doe@email.com', 'john.doe', 'Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=', 'admin', 0, 1, 1, GETUTCDATE(), NULL),
(2, 'Jane', 'Doe', 'jane.doe@email.com', 'jane.doe', 'YhyGVQ+Ch69n4JMBncM4lNF/i9s=', 'Ar/aB2thQTI=', 'teacher', 1, 0, 1, GETUTCDATE(), NULL),
(3, 'Alice', 'Johnson', 'alice.j@email.com', 'alice.j', 'hashed_password', 'salt_value', 'student', 0, 0, 1, GETUTCDATE(), NULL),
(4, 'Bob', 'Smith', 'bob.smith@email.com', 'bob.smith', 'hashed_password', 'salt_value', 'student', 0, 0, 1, GETUTCDATE(), NULL);

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
(1, 3, 'Linear Algebra', 'Linear algebra concepts', GETUTCDATE(), NULL, 1),
(2, 1, 'Shakespearean Literature', 'Shakespearean plays lecture', GETUTCDATE(), NULL, 1),
(2, 2, 'Romantic Poetry', 'Study of Romantic poetry', GETUTCDATE(), NULL, 1);

-- Populate sources table
INSERT INTO sources (curriculum_element_id, source_url, created_date, last_updated, isActive)
VALUES
(1, 'https://example.com/algebra-lecture', GETUTCDATE(), NULL, 1),
(2, 'https://example.com/calculus-lecture', GETUTCDATE(), NULL, 1),
(3, 'https://example.com/linear-algebra-lecture', GETUTCDATE(), NULL, 1),
(4, 'https://example.com/shakespeare-lecture', GETUTCDATE(), NULL, 1),
(5, 'https://example.com/romantic-poetry-lecture', GETUTCDATE(), NULL, 1);

-- Populate assignments table
INSERT INTO assignments (curriculum_element_id, title, description, assignment_type, created_date, last_updated, isActive)
VALUES
(1, 'Algebra Homework 1', 'Homework on algebra basics', 'homework', GETUTCDATE(), NULL, 1),
(1, 'Algebra Quiz 1', 'Quiz on algebra basics', 'quiz', GETUTCDATE(), NULL, 1),
(2, 'Calculus Homework 1', 'Homework on calculus principles', 'homework', GETUTCDATE(), NULL, 1),
(2, 'Calculus Quiz 2', 'Quiz on advanced calculus', 'quiz', GETUTCDATE(), NULL, 1),
(3, 'Linear Algebra Homework 1', 'Homework on linear algebra', 'homework', GETUTCDATE(), NULL, 1),
(4, 'Shakespeare Essay', 'Essay on Shakespearean literature', 'essay', GETUTCDATE(), NULL, 1),
(5, 'Romantic Poetry Essay', 'Essay on Romantic poetry', 'essay', GETUTCDATE(), NULL, 1);

-- Populate questions table
INSERT INTO questions (prompt, question_type, answer_1, answer_2, answer_3, answer_4, correct_choice_answer, created_date, last_updated, isActive)
VALUES
-- Questions for Algebra Homework 1
('What is the solution to x + 3 = 7?', 'choice', '4', '6', '8', '10', 1, GETUTCDATE(), NULL, 1),
('Solve for x: 2x - 5 = 7', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1),

-- Questions for Algebra Quiz 1
('What is the integral of x^2?', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1),
('What is the derivative of sin(x)?', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1),

-- Questions for Calculus Homework 1
('Find the limit as x approaches 0 for (sin(x)/x).', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1),
('Evaluate the definite integral: ∫(x^2)dx from 0 to 2.', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1),

-- Questions for Calculus Quiz 2
('What is the solution to the differential equation dy/dx = 2x?', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1),
('Find the derivative of ln(x) with respect to x.', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1),

-- Questions for Linear Algebra Homework 1
('What is the determinant of a 2x2 matrix [[a, b], [c, d]]?', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1),
('Find the eigenvalues of the matrix [[3, 1], [1, 3]].', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1),

-- Questions for Shakespeare Essay
('Discuss the themes of betrayal in the play "Othello."', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1),
('Analyze the character development of Hamlet in the play "Hamlet."', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1),

-- Questions for Romantic Poetry Essay
('Compare and contrast the themes of nature in the poems of Wordsworth and Keats.', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1),
('Discuss the influence of historical events on the Romantic poets.', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1);

-- Populate assignments_questions table
INSERT INTO assignments_questions (assignment_id, question_id)
VALUES
-- Algebra Homework 1 questions
(1, 1),
(1, 2),

-- Algebra Quiz 1 questions
(2, 3),
(2, 4),

-- Calculus Homework 1 questions
(3, 5),
(3, 6),

-- Calculus Quiz 2 questions
(4, 7),
(4, 8),

-- Linear Algebra Homework 1 questions
(5, 9),
(5, 10),

-- Shakespeare Essay questions
(6, 11),
(6, 12),

-- Romantic Poetry Essay questions
(7, 13),
(7, 14);

-- Reset identity insert
SET IDENTITY_INSERT users OFF;

-- Populate submitted_assignments table
INSERT INTO submitted_assignments (assignment_id, student_id, teacher_id, course_id, score, graded_date, created_date)
VALUES
-- Submitted assignments for Algebra Homework 1
(1, 3, 2, 1, 0, NULL, GETUTCDATE()),
(1, 4, 2, 1, 0, NULL, GETUTCDATE()),

-- Submitted assignments for Algebra Quiz 1
(2, 4, 2, 1, 0, NULL, GETUTCDATE()),

-- Submitted assignments for Calculus Homework 1
(3, 3, 2, 1, 0, NULL, GETUTCDATE()),

-- Submitted assignments for Calculus Quiz 2
(4, 4, 2, 1, 0, NULL, GETUTCDATE()),

-- Submitted assignments for Linear Algebra Homework 1
(5, 4, 2, 1, 0, NULL, GETUTCDATE()),

-- Submitted assignments for Shakespeare Essay
(6, 4, 2, 2, 0, NULL, GETUTCDATE()),

-- Submitted assignments for Romantic Poetry Essay
(7, 4, 2, 2, 0, NULL, GETUTCDATE());

-- Populate answers table
INSERT INTO answers (submitted_assignment_id, question_type, answer_choice, answer_text, answer_external, isCorrect, last_updated, number_of_edits)
VALUES
-- Answers for Algebra Homework 1
(1, 'choice', 1, NULL, NULL, 0, NULL, 0),
(1, 'text', NULL, 'The solution is x = 4.', NULL, 0, NULL, 0),

-- Answers for Algebra Quiz 1
(2, 'text', NULL, 'The integral is (1/3)x^3 + C.', NULL, 0, NULL, 0),
(2, 'text', NULL, 'The derivative of sin(x) is cos(x).', NULL, 0, NULL, 0),

-- Answers for Calculus Homework 1
(3, 'text', NULL, 'The limit is 1.', NULL, 0, NULL, 0),
(3, 'text', NULL, 'The integral is (1/3)x^3 + C.', NULL, 0, NULL, 0),

-- Answers for Calculus Quiz 2
(4, 'text', NULL, 'The solution is y = Ce^(x^2).', NULL, 0, NULL, 0),
(4, 'text', NULL, 'The derivative of ln(x) is 1/x.', NULL, 0, NULL, 0),

-- Answers for Linear Algebra Homework 1
(5, 'text', NULL, 'The determinant is ad - bc.', NULL, 0, NULL, 0),
(5, 'text', NULL, 'The eigenvalues are 4 and 2.', NULL, 0, NULL, 0),

-- Answers for Shakespeare Essay
(6, 'text', NULL, 'Othello portrays themes of jealousy and manipulation.', NULL, 0, NULL, 0),
(6, 'text', NULL, 'Hamlet undergoes a complex character transformation.', NULL, 0, NULL, 0),

-- Answers for Romantic Poetry Essay
(7, 'text', NULL, 'Wordsworth emphasizes nature''s impact on the human spirit.', NULL, 0, NULL, 0),
(7, 'text', NULL, 'Romantic poets were influenced by political and social changes.', NULL, 0, NULL, 0);

-- Populate comments table
INSERT INTO comments (submitted_assignment_id, created_by, comment, created_date, last_updated, number_of_edits)
VALUES
-- Comments for Algebra Homework 1
(1, 2, 'Great work on question 2!', GETUTCDATE(), NULL, 0),
(1, 2, 'You showed excellent problem-solving skills.', GETUTCDATE(), NULL, 0),

-- Comments for Algebra Quiz 1
(2, 2, 'Well done on both questions!', GETUTCDATE(), NULL, 0),
(2, 2, 'Your understanding of integration is commendable.', GETUTCDATE(), NULL, 0),

-- Comments for Calculus Homework 1
(3, 2, 'You demonstrated a clear understanding of limits.', GETUTCDATE(), NULL, 0),
(3, 2, 'Impressive work on the definite integral!', GETUTCDATE(), NULL, 0),

-- Comments for Calculus Quiz 2
(4, 2, 'Your solutions were well-explained.', GETUTCDATE(), NULL, 0),
(4, 2, 'Good job on the derivative of ln(x) question.', GETUTCDATE(), NULL, 0),

-- Comments for Linear Algebra Homework 1
(5, 2, 'Excellent explanation of determinants!', GETUTCDATE(), NULL, 0),
(5, 2, 'Your understanding of eigenvalues is commendable.', GETUTCDATE(), NULL, 0),

-- Comments for Shakespeare Essay
(6, 2, 'Insightful analysis of themes in "Othello."', GETUTCDATE(), NULL, 0),
(6, 2, 'Your interpretation of Hamlet''s character is intriguing.', GETUTCDATE(), NULL, 0),

-- Comments for Romantic Poetry Essay
(7, 2, 'Well-researched comparison of Wordsworth and Keats.', GETUTCDATE(), NULL, 0),
(7, 2, 'Your exploration of the historical context is noteworthy.', GETUTCDATE(), NULL, 0);

-- Insert teacher_keys
INSERT INTO teacher_keys (teacher_key, username)
VALUES
(NEWID(), 'jane.doe')
