-- Set identity insert on for users
SET IDENTITY_INSERT users ON;

INSERT INTO users (user_id, first_name, last_name, email, username, password_hash, salt, user_role, isTeacher, isAdmin, isActive, created_date, last_updated)
VALUES
(1, 'John', 'Doe', 'john.doe@email.com', 'john.doe', 'Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=', 'admin', 0, 1, 1, GETUTCDATE(), NULL),
(2, 'Jane', 'Doe', 'jane.doe@email.com', 'jane.doe', 'YhyGVQ+Ch69n4JMBncM4lNF/i9s=', 'Ar/aB2thQTI=', 'teacher', 1, 0, 1, GETUTCDATE(), NULL),
(3, 'Alice', 'Johnson', 'alice.j@email.com', 'alice.j', 'hashed_password', 'salt_value', 'student', 0, 0, 1, GETUTCDATE(), NULL),
(4, 'Bob', 'Smith', 'bob.smith@email.com', 'bob.smith', 'hashed_password', 'salt_value', 'student', 0, 0, 1, GETUTCDATE(), NULL),
(5, 'learn', 'well', 'learn@gmail.com', 'learnwell', 'S9nRezNystgbIjR4zDMNPP30WaY=', 'DOivTu4QvPo=', 'student', 0, 0, 1, GETUTCDATE(), NULL),
(6, 'jennifer', 'julie', 'Jen@email.com','Jenjulie', 'HhqXnMi5WyG9gdE7xs0WxGOq+fI=', 'Y/qhDn113BE=', 'student', 0, 0, 1, GETUTCDATE(), NULL);

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
(2, 4, GETUTCDATE(), 1),
(2, 5, GETUTCDATE(), 1),
(2, 6, GETUTCDATE(), 1),
(1, 6, GETUTCDATE(), 1),
(1, 5, GETUTCDATE(), 1);

-- Populate curriculum_elements table with additional elements and full lectures
INSERT INTO curriculum_elements (course_id, course_order, description, lecture_content, created_date, last_updated, isActive)
VALUES
-- Additional elements for Math 101
(1, 1, 'Introduction to Algebra', 'Welcome to the "Introduction to Algebra" lecture! In this session, we will explore the foundational concepts of algebra. Algebra is the branch of mathematics that deals with variables and the rules for manipulating them. Get ready to dive into solving equations, working with expressions, and understanding the fundamental principles that underlie algebraic thinking. By the end of this lecture, you will have a solid grasp of algebra basics and be well-prepared for the exciting journey ahead in this course.', GETUTCDATE(), NULL, 1),

(1, 2, 'Advanced Calculus', 'Welcome to the "Advanced Calculus" lecture! Building on the fundamentals of calculus, this session will take you to the next level of mathematical understanding. We will explore advanced topics such as multivariable calculus, vector calculus, and applications in various fields. Prepare to enhance your problem-solving skills and gain a deeper insight into the beauty of mathematical analysis. Get ready for a challenging yet rewarding exploration of calculus principles.', GETUTCDATE(), NULL, 1),

(1, 3, 'Linear Algebra', 'Welcome to the "Linear Algebra" lecture! Linear algebra is a powerful mathematical tool with applications in various fields, including physics, computer science, and engineering. In this session, we will delve into the key concepts of linear algebra, such as matrices, determinants, and eigenvalues. Explore the fundamental principles that govern linear transformations and discover the importance of linear algebra in solving real-world problems. By the end of this lecture, you will have a solid foundation in linear algebra concepts.', GETUTCDATE(), NULL, 1),

(1, 4, 'Geometry Fundamentals', 'Welcome to the world of geometry! In this lecture, we will delve into the foundational principles of Euclidean geometry. We will explore the basic geometric shapes, angles, and the art of geometric proofs. Get ready to visualize and reason with shapes!', GETUTCDATE(), NULL, 1),

(1, 5, 'Trigonometry Basics', 'Trigonometry is the study of triangles and the relationships between their sides and angles. In this lecture, we will cover the basics of trigonometric functions, including sine, cosine, and tangent. Prepare to unlock the secrets of triangles and understand their applications in real-world problems.', GETUTCDATE(), NULL, 1),

(1, 6, 'Probability and Statistics', 'Probability and statistics play a crucial role in understanding uncertainty and variability. In this lecture, we will explore the fundamentals of probability, data analysis, and statistical inference. Gain the skills to make informed decisions in the face of uncertainty.', GETUTCDATE(), NULL, 1),

(1, 7, 'Number Theory', 'Welcome to the fascinating world of number theory! In this lecture, we will delve into the properties of integers, prime numbers, and divisibility rules. Explore the beauty of number patterns and the secrets they hold. Get ready for a journey into the heart of pure mathematics!', GETUTCDATE(), NULL, 1),

(1, 8, 'Advanced Calculus Topics', 'Ready for a deeper dive into calculus? This lecture will explore advanced topics in calculus, including multivariable calculus, vector calculus, and applications in physics and engineering. Get ready to tackle complex mathematical concepts and enhance your problem-solving skills.', GETUTCDATE(), NULL, 1),

(1, 9, 'Differential Equations', 'Differential equations are powerful tools for modeling real-world phenomena. In this lecture, we will study ordinary and partial differential equations, exploring their solutions and applications. Join us on a journey to understand the dynamics of change in various scientific and engineering fields.', GETUTCDATE(), NULL, 1),

(1, 10, 'Mathematical Logic', 'Welcome to the world of mathematical logic! In this lecture, we will explore the fundamental principles of mathematical logic, including propositional and first-order logic. Learn the art of constructing logical arguments and proofs. Get ready to enhance your reasoning skills!', GETUTCDATE(), NULL, 1),

-- Additional elements for English 201
(2, 1, 'Shakespearean Literature', 'Welcome to the "Shakespearean Literature" lecture! In this session, we will immerse ourselves in the world of William Shakespeare, one of the greatest playwrights and poets in history. We will explore the timeless beauty of Shakespearean plays, including tragedies, comedies, and histories. Delve into the rich language, complex characters, and profound themes that define Shakespearean literature. By the end of this lecture, you will have a deep appreciation for the Bard and his enduring impact on the world of literature.', GETUTCDATE(), NULL, 1),

(2, 2, 'Romantic Poetry', 'Welcome to the "Romantic Poetry" lecture! In this session, we will embark on a poetic journey through the Romantic era, a period marked by intense emotions, nature appreciation, and artistic freedom. We will study the works of major Romantic poets and analyze the themes that characterize their poetry. Explore the beauty of nature, the expression of individualism, and the passionate exploration of human experience. By the end of this lecture, you will have a profound understanding of the Romantic poetry movement.', GETUTCDATE(), NULL, 1),

(2, 3, 'Victorian Literature', 'Step into the Victorian era through the lens of literature! In this lecture, we will explore the major themes and works of Victorian literature. Dive into the societal influences that shaped this period and discover the rich tapestry of novels, poetry, and essays.', GETUTCDATE(), NULL, 1),

(2, 4, 'Modernist Literature', 'Embark on a journey into the avant-garde world of modernist literature! This lecture will delve into the literary movements and experimentation that defined the modernist period. Explore the works of influential writers who pushed the boundaries of traditional storytelling.', GETUTCDATE(), NULL, 1),

(2, 5, 'Post-Colonial Literature', 'Explore the diverse voices of post-colonial literature in this captivating lecture. We will analyze literary works that address the legacies of colonialism and the complexities of cultural identity. Join us in unraveling the narratives that emerged in the post-colonial world.', GETUTCDATE(), NULL, 1),

(2, 6, 'Literary Criticism', 'Welcome to the world of literary criticism! In this lecture, we will introduce various approaches to analyzing and interpreting literature. Gain insights into the different schools of thought and critical lenses that scholars use to explore the deeper meanings within literary works.', GETUTCDATE(), NULL, 1),

(2, 7, 'Creative Writing Workshop', 'Unleash your creativity in this hands-on workshop! This lecture will guide you through various forms of creative writing, including fiction, poetry, and non-fiction. Discover techniques to express your unique voice and tell compelling stories.', GETUTCDATE(), NULL, 1),

(2, 8, 'Shakespearean Tragedies', 'Step onto the stage of Shakespearean tragedies! In this lecture, we will dive deep into the tragic plays of William Shakespeare. Analyze the profound themes, complex characters, and timeless tragedies that have captivated audiences for centuries.', GETUTCDATE(), NULL, 1),

(2, 9, 'Modern Poetry', 'Experience the beauty of modern poetry in this enlightening lecture. We will explore the major movements and poets of the modernist and post-modernist periods. Discover the diverse forms and innovative expressions that characterize modern poetry.', GETUTCDATE(), NULL, 1),

(2, 10, 'Literary Theory', 'Delve into the realm of literary theory in this thought-provoking lecture. We will examine major literary theories and their applications, from structuralism to postcolonialism. Gain a deeper understanding of how different perspectives shape our interpretation of literature.', GETUTCDATE(), NULL, 1);


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
INSERT INTO answers (submitted_assignment_id, question_id, question_type, answer_choice, answer_text, answer_external, isCorrect, last_updated, number_of_edits)
VALUES
-- Answers for Algebra Homework 1
(1, 1, 'choice', 1, NULL, NULL, 0, NULL, 0),
(1, 2, 'text', NULL, 'The solution is x = 4.', NULL, 0, NULL, 0),

-- Answers for Algebra Homework 1 (second submission)
(1, 1, 'choice', 2, NULL, NULL, 0, NULL, 0),
(1, 2, 'text', NULL, 'Another answer for question 2.', NULL, 0, NULL, 0),

-- Answers for Algebra Quiz 1
(2, 3, 'text', NULL, 'The integral is (1/3)x^3 + C.', NULL, 0, NULL, 0),
(2, 4, 'text', NULL, 'The derivative of sin(x) is cos(x).', NULL, 0, NULL, 0),

-- Answers for Calculus Homework 1
(3, 5, 'text', NULL, 'The limit is 1.', NULL, 0, NULL, 0),
(3, 6, 'text', NULL, 'The integral is (1/3)x^3 + C.', NULL, 0, NULL, 0),

-- Answers for Calculus Quiz 2
(4, 7, 'text', NULL, 'The solution is y = Ce^(x^2).', NULL, 0, NULL, 0),
(4, 8, 'text', NULL, 'The derivative of ln(x) is 1/x.', NULL, 0, NULL, 0),

-- Answers for Linear Algebra Homework 1
(5, 9, 'text', NULL, 'The determinant is ad - bc.', NULL, 0, NULL, 0),
(5, 10, 'text', NULL, 'The eigenvalues are 4 and 2.', NULL, 0, NULL, 0),

-- Answers for Shakespeare Essay
(6, 11, 'text', NULL, 'Othello portrays themes of jealousy and manipulation.', NULL, 0, NULL, 0),
(6, 12, 'text', NULL, 'Hamlet undergoes a complex character transformation.', NULL, 0, NULL, 0),

-- Answers for Romantic Poetry Essay
(7, 13, 'text', NULL, 'Wordsworth emphasizes nature''s impact on the human spirit.', NULL, 0, NULL, 0),
(7, 14, 'text', NULL, 'Romantic poets were influenced by political and social changes.', NULL, 0, NULL, 0);

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
