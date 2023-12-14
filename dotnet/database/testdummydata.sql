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
-- Sources for Math 101 curriculum elements
INSERT INTO sources (curriculum_element_id, source_url, created_date, last_updated, isActive)
VALUES
-- Introduction to Algebra
(1, 'https://www.mathisfun.com/algebra/algebra-introduction.html', GETUTCDATE(), NULL, 1),

(1, 'https://www.khanacademy.org/math/algebra', GETUTCDATE(), NULL, 1),

-- Advanced Calculus
(2, 'https://ocw.mit.edu/courses/mathematics/18-02sc-multivariable-calculus-fall-2010/', GETUTCDATE(), NULL, 1),

(2, 'https://www.khanacademy.org/math/multivariable-calculus', GETUTCDATE(), NULL, 1),

-- Linear Algebra
(3, 'https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/', GETUTCDATE(), NULL, 1),

(3, 'https://www.mathway.com/Algebra', GETUTCDATE(), NULL, 1),

-- Geometry Fundamentals
(4, 'https://www.mathsisfun.com/geometry/index.html', GETUTCDATE(), NULL, 1),

(4, 'https://www.khanacademy.org/math/geometry', GETUTCDATE(), NULL, 1),

-- Trigonometry Basics
(5, 'https://www.mathplanet.com/education/algebra-2/trigonometry', GETUTCDATE(), NULL, 1),

(5, 'https://www.khanacademy.org/math/trigonometry', GETUTCDATE(), NULL, 1),

-- Probability and Statistics
(6, 'https://www.khanacademy.org/math/statistics-probability', GETUTCDATE(), NULL, 1),

(6, 'https://stattrek.com/statistics/probability/probability.aspx', GETUTCDATE(), NULL, 1),

-- Number Theory
(7, 'https://brilliant.org/wiki/number-theory/', GETUTCDATE(), NULL, 1),

(7, 'https://www.math.nmsu.edu/hist_projects/number-theory/', GETUTCDATE(), NULL, 1),

-- Advanced Calculus Topics
(8, 'https://mathworld.wolfram.com/AdvancedCalculus.html', GETUTCDATE(), NULL, 1),

(8, 'https://ocw.mit.edu/courses/mathematics/18-901-introduction-to-topology-fall-2004/', GETUTCDATE(), NULL, 1),

-- Differential Equations
(9, 'https://www.math.ucdavis.edu/~hunter/book/', GETUTCDATE(), NULL, 1),

(9, 'https://ocw.mit.edu/courses/mathematics/18-03-differential-equations-spring-2010/', GETUTCDATE(), NULL, 1),

-- Mathematical Logic
(10, 'https://plato.stanford.edu/entries/logic-mathematical/', GETUTCDATE(), NULL, 1),

(10, 'https://www.math.wisc.edu/~miller/old/logicb.pdf', GETUTCDATE(), NULL, 1);


-- Sources for English 201 curriculum elements
INSERT INTO sources (curriculum_element_id, source_url, created_date, last_updated, isActive)
VALUES
-- Shakespearean Literature
(11, 'https://www.sparknotes.com/shakespeare/', GETUTCDATE(), NULL, 1),

(11, 'https://www.shakespeare-online.com/', GETUTCDATE(), NULL, 1),

-- Romantic Poetry
(12, 'https://www.poetryfoundation.org/collections/145725/poetry-and-the-romantic-period', GETUTCDATE(), NULL, 1),

(12, 'https://www.bartleby.com/106/', GETUTCDATE(), NULL, 1),

-- Victorian Literature
(13, 'https://www.victorianweb.org/', GETUTCDATE(), NULL, 1),

(13, 'https://www.bl.uk/romantics-and-victorians', GETUTCDATE(), NULL, 1),

-- Modernist Literature
(14, 'https://www.modernismlab.com/', GETUTCDATE(), NULL, 1),

(14, 'https://www.poetryfoundation.org/collections/145738/guide-to-modernism', GETUTCDATE(), NULL, 1),

-- Post-Colonial Literature
(15, 'https://www.postcolonialweb.org/', GETUTCDATE(), NULL, 1),

(15, 'https://www.cambridge.org/core/what-we-publish/publishing-partners/postcolonial-text', GETUTCDATE(), NULL, 1),

-- Literary Criticism
(16, 'https://www.jstor.org/subject/literary-criticism', GETUTCDATE(), NULL, 1),

(16, 'https://www.sparknotes.com/lit/criticism/', GETUTCDATE(), NULL, 1),

-- Creative Writing Workshop
(17, 'https://www.masterclass.com/', GETUTCDATE(), NULL, 1),

(17, 'https://www.writingclasses.com/', GETUTCDATE(), NULL, 1),

-- Shakespearean Tragedies
(18, 'https://www.shakespeare.org.uk/explore-shakespeare/blogs/guide-to-shakespearean-tragedy/', GETUTCDATE(), NULL, 1),

(18, 'https://www.thoughtco.com/shakespearean-tragedy-2985121', GETUTCDATE(), NULL, 1),

-- Modern Poetry
(19, 'https://www.poetryfoundation.org/collections/145731/modern-and-contemporary-poetry', GETUTCDATE(), NULL, 1),

(19, 'https://www.loc.gov/rr/program/bib/ourdocs/poets.html', GETUTCDATE(), NULL, 1),

-- Literary Theory
(20, 'https://plato.stanford.edu/entries/literary-theory/', GETUTCDATE(), NULL, 1),

(20, 'https://www.bl.uk/20th-century-literature/articles/introduction-to-literary-modernism', GETUTCDATE(), NULL, 1);


--ADD ASSIGNMENTS HERE


-- Add assignments for Introduction to Algebra (curriculum_element_id = 1)
INSERT INTO assignments (curriculum_element_id, title, description, assignment_type, created_date, last_updated, isActive)
VALUES
(1, 'Algebra Basics Assignment 1', 'Assignment covering fundamental algebra concepts', 'homework', GETUTCDATE(), NULL, 1),
(1, 'Algebra Basics Assignment 2', 'Assignment with advanced algebra problems', 'quiz', GETUTCDATE(), NULL, 1);

-- Add assignments for Advanced Calculus (curriculum_element_id = 2)
INSERT INTO assignments (curriculum_element_id, title, description, assignment_type, created_date, last_updated, isActive)
VALUES
(2, 'Advanced Calculus Problems Set 1', 'Assignment with challenging calculus problems', 'homework', GETUTCDATE(), NULL, 1),
(2, 'Advanced Calculus Problems Set 2', 'More advanced problems to enhance calculus skills', 'quiz', GETUTCDATE(), NULL, 1);

-- Add assignments for Linear Algebra (curriculum_element_id = 3)
INSERT INTO assignments (curriculum_element_id, title, description, assignment_type, created_date, last_updated, isActive)
VALUES
(3, 'Linear Algebra Assignment 1', 'Assignment covering matrix operations', 'homework', GETUTCDATE(), NULL, 1),
(3, 'Linear Algebra Assignment 2', 'Assignment on eigenvalues and eigenvectors', 'quiz', GETUTCDATE(), NULL, 1);

-- Add assignments for Geometry Fundamentals (curriculum_element_id = 4)
INSERT INTO assignments (curriculum_element_id, title, description, assignment_type, created_date, last_updated, isActive)
VALUES
(4, 'Geometry Basics Assignment', 'Assignment covering fundamental principles of Euclidean geometry', 'homework', GETUTCDATE(), NULL, 1),
(4, 'Geometric Proofs Assignment', 'Assignment focused on constructing and understanding geometric proofs', 'quiz', GETUTCDATE(), NULL, 1);

-- Add assignments for Trigonometry Basics (curriculum_element_id = 5)
INSERT INTO assignments (curriculum_element_id, title, description, assignment_type, created_date, last_updated, isActive)
VALUES
(5, 'Trigonometry Assignment 1', 'Assignment covering basic trigonometric functions', 'homework', GETUTCDATE(), NULL, 1),
(5, 'Applications of Trigonometry Assignment', 'Assignment exploring real-world applications of trigonometry', 'quiz', GETUTCDATE(), NULL, 1);

-- Add assignments for Probability and Statistics (curriculum_element_id = 6)
INSERT INTO assignments (curriculum_element_id, title, description, assignment_type, created_date, last_updated, isActive)
VALUES
(6, 'Probability Assignment', 'Assignment covering fundamental concepts of probability', 'homework', GETUTCDATE(), NULL, 1),
(6, 'Statistics Project', 'Project-based assignment for applying statistical analysis', 'quiz', GETUTCDATE(), NULL, 1);

-- Add assignments for Number Theory (curriculum_element_id = 7)
INSERT INTO assignments (curriculum_element_id, title, description, assignment_type, created_date, last_updated, isActive)
VALUES
(7, 'Number Theory Exploration', 'Assignment exploring properties of integers and prime numbers', 'homework', GETUTCDATE(), NULL, 1),
(7, 'Diophantine Equations Assignment', 'Assignment focused on solving Diophantine equations', 'quiz', GETUTCDATE(), NULL, 1);

-- Add assignments for Advanced Calculus Topics (curriculum_element_id = 8)
INSERT INTO assignments (curriculum_element_id, title, description, assignment_type, created_date, last_updated, isActive)
VALUES
(8, 'Multivariable Calculus Assignment', 'Assignment exploring concepts in multivariable calculus', 'homework', GETUTCDATE(), NULL, 1),
(8, 'Applications of Calculus in Engineering', 'Assignment applying calculus concepts to engineering problems', 'quiz', GETUTCDATE(), NULL, 1);

-- Add assignments for Differential Equations (curriculum_element_id = 9)
INSERT INTO assignments (curriculum_element_id, title, description, assignment_type, created_date, last_updated, isActive)
VALUES
(9, 'Ordinary Differential Equations Assignment', 'Assignment on solving ordinary differential equations', 'homework', GETUTCDATE(), NULL, 1),
(9, 'Partial Differential Equations Project', 'Project-based assignment for exploring partial differential equations', 'quiz', GETUTCDATE(), NULL, 1);

-- Add assignments for Mathematical Logic (curriculum_element_id = 10)
INSERT INTO assignments (curriculum_element_id, title, description, assignment_type, created_date, last_updated, isActive)
VALUES
(10, 'Propositional Logic Assignment', 'Assignment covering basic principles of propositional logic', 'homework', GETUTCDATE(), NULL, 1),
(10, 'First-Order Logic Exploration', 'Assignment exploring concepts in first-order logic', 'quiz', GETUTCDATE(), NULL, 1);

-- Add assignments for Shakespearean Literature (curriculum_element_id = 11)
INSERT INTO assignments (curriculum_element_id, title, description, assignment_type, created_date, last_updated, isActive)
VALUES
(11, 'Shakespearean Play Analysis', 'Analyze and interpret a selected Shakespearean play', 'homework', GETUTCDATE(), NULL, 1),
(11, 'Shakespearean Sonnet Exploration', 'Explore the themes and structure of Shakespearean sonnets', 'homework', GETUTCDATE(), NULL, 1);

-- Add assignments for Romantic Poetry (curriculum_element_id = 12)
INSERT INTO assignments (curriculum_element_id, title, description, assignment_type, created_date, last_updated, isActive)
VALUES
(12, 'Nature in Romantic Poetry', 'Examine the portrayal of nature in Romantic poems', 'homework', GETUTCDATE(), NULL, 1),
(12, 'Comparison of Romantic Poets', 'Compare the works of two Romantic poets', 'homework', GETUTCDATE(), NULL, 1);

-- Add assignments for Victorian Literature (curriculum_element_id = 13)
INSERT INTO assignments (curriculum_element_id, title, description, assignment_type, created_date, last_updated, isActive)
VALUES
(13, 'Victorian Novel Analysis', 'Analyze a selected Victorian novel in depth', 'homework', GETUTCDATE(), NULL, 1),
(13, 'Social Themes in Victorian Literature', 'Explore the social themes depicted in Victorian literature', 'homework', GETUTCDATE(), NULL, 1);

-- Add assignments for Modernist Literature (curriculum_element_id = 14)
INSERT INTO assignments (curriculum_element_id, title, description, assignment_type, created_date, last_updated, isActive)
VALUES
(14, 'Modernist Movement Analysis', 'Analyze the characteristics of the modernist literary movement', 'homework', GETUTCDATE(), NULL, 1),
(14, 'Stream of Consciousness Writing', 'Experiment with the stream of consciousness writing style', 'homework', GETUTCDATE(), NULL, 1);

-- Add assignments for Post-Colonial Literature (curriculum_element_id = 15)
INSERT INTO assignments (curriculum_element_id, title, description, assignment_type, created_date, last_updated, isActive)
VALUES
(15, 'Post-Colonial Novel Study', 'Study and analyze a selected post-colonial novel', 'homework', GETUTCDATE(), NULL, 1),
(15, 'Cultural Identity in Post-Colonial Literature', 'Explore the theme of cultural identity in post-colonial literature', 'homework', GETUTCDATE(), NULL, 1);

-- Add assignments for Literary Criticism (curriculum_element_id = 16)
INSERT INTO assignments (curriculum_element_id, title, description, assignment_type, created_date, last_updated, isActive)
VALUES
(16, 'Critical Analysis of a Literary Work', 'Conduct a critical analysis of a selected literary work', 'homework', GETUTCDATE(), NULL, 1),
(16, 'Application of Literary Theories', 'Apply different literary theories to a specific text', 'homework', GETUTCDATE(), NULL, 1);

-- Add assignments for Creative Writing Workshop (curriculum_element_id = 17)
INSERT INTO assignments (curriculum_element_id, title, description, assignment_type, created_date, last_updated, isActive)
VALUES
(17, 'Short Story Writing', 'Create an original short story in the workshop', 'homework', GETUTCDATE(), NULL, 1),
(17, 'Poetry Composition', 'Compose and share original poetry in the workshop', 'homework', GETUTCDATE(), NULL, 1);

-- Add assignments for Shakespearean Tragedies (curriculum_element_id = 18)
INSERT INTO assignments (curriculum_element_id, title, description, assignment_type, created_date, last_updated, isActive)
VALUES
(18, 'Tragic Themes in Shakespearean Plays', 'Explore and analyze tragic themes in selected plays', 'homework', GETUTCDATE(), NULL, 1),
(18, 'Character Analysis in Tragedies', 'Conduct a detailed analysis of characters in Shakespearean tragedies', 'homework', GETUTCDATE(), NULL, 1);

-- Add assignments for Modern Poetry (curriculum_element_id = 19)
INSERT INTO assignments (curriculum_element_id, title, description, assignment_type, created_date, last_updated, isActive)
VALUES
(19, 'Modernist Poetry Exploration', 'Explore the themes and techniques of modernist poetry', 'homework', GETUTCDATE(), NULL, 1),
(19, 'Performance Poetry Showcase', 'Create and perform a piece of modern poetry in the workshop', 'homework', GETUTCDATE(), NULL, 1);

-- Add assignments for Literary Theory (curriculum_element_id = 20)
INSERT INTO assignments (curriculum_element_id, title, description, assignment_type, created_date, last_updated, isActive)
VALUES
(20, 'Structuralism vs. Poststructuralism Debate', 'Participate in a debate on structuralism and poststructuralism in literature', 'homework', GETUTCDATE(), NULL, 1),
(20, 'Application of Feminist Literary Criticism', 'Apply feminist literary criticism to analyze a selected text', 'homework', GETUTCDATE(), NULL, 1);


-- Populate questions table

-- Questions for Algebra Basics Assignment 1 (assignment_id = 1)
INSERT INTO questions (prompt, question_type, answer_1, answer_2, answer_3, answer_4, correct_choice_answer, created_date, last_updated, isActive)
VALUES
('Solve the equation: 2x + 5 = 13', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1),
('Factor the quadratic expression: x^2 + 4x + 4', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1);

-- Questions for Algebra Basics Assignment 2 (assignment_id = 2)
INSERT INTO questions (prompt, question_type, answer_1, answer_2, answer_3, answer_4, correct_choice_answer, created_date, last_updated, isActive)
VALUES
('Simplify the expression: (3x^2 + 2x) / (x + 1)', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1),
('Solve the system of equations: { 2x + y = 5, x - y = 1 }', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1);

-- Questions for Advanced Calculus Problems Set 1 (assignment_id = 3)
INSERT INTO questions (prompt, question_type, answer_1, answer_2, answer_3, answer_4, correct_choice_answer, created_date, last_updated, isActive)
VALUES
('Find the limit as x approaches 0 of (sinx / x)', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1),
('Calculate the partial derivative of f(x, y) = x^2y + sin(xy) with respect to x', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1);

-- Questions for Advanced Calculus Problems Set 2 (assignment_id = 4)
INSERT INTO questions (prompt, question_type, answer_1, answer_2, answer_3, answer_4, correct_choice_answer, created_date, last_updated, isActive)
VALUES
('Evaluate the line integral ∮C (x^2 + y^2) ds, where C is the circle of radius 2 centered at the origin', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1),
('Find the global maximum and minimum values of the function f(x, y) = x^2 + y^2 - 2xy on the region D: 0 <= x <= 1, 0 <= y <= 1', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1);

-- Questions for Linear Algebra Assignment 1 (assignment_id = 5)
INSERT INTO questions (prompt, question_type, answer_1, answer_2, answer_3, answer_4, correct_choice_answer, created_date, last_updated, isActive)
VALUES
('Perform matrix multiplication for the matrices A and B: A = [1 2; 3 4], B = [5 6; 7 8]', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1),
('Compute the determinant of the matrix C: C = [2 0; -1 3]', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1);

-- Questions for Linear Algebra Assignment 2 (assignment_id = 6)
INSERT INTO questions (prompt, question_type, answer_1, answer_2, answer_3, answer_4, correct_choice_answer, created_date, last_updated, isActive)
VALUES
('Find the eigenvalues of the matrix D: D = [4 -1; 2 1]', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1),
('Solve the system of linear equations using matrix inversion: Ax = B, where A = [2 1; 3 -2], B = [5; 2]', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1);

-- Questions for Geometry Basics Assignment (assignment_id = 7)
INSERT INTO questions (prompt, question_type, answer_1, answer_2, answer_3, answer_4, correct_choice_answer, created_date, last_updated, isActive)
VALUES
('Calculate the area of a triangle with base 8 units and height 6 units', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1),
('Determine the measure of each interior angle in a regular hexagon', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1);

-- Questions for Geometric Proofs Assignment (assignment_id = 8)
INSERT INTO questions (prompt, question_type, answer_1, answer_2, answer_3, answer_4, correct_choice_answer, created_date, last_updated, isActive)
VALUES
('Prove the Pythagorean Theorem for a right-angled triangle', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1),
('Construct a proof for the statement: "The diagonals of a rectangle are equal."', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1);

-- Questions for Probability Assignment (assignment_id = 9)
INSERT INTO questions (prompt, question_type, answer_1, answer_2, answer_3, answer_4, correct_choice_answer, created_date, last_updated, isActive)
VALUES
('A fair six-sided die is rolled. What is the probability of rolling an even number?', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1),
('Calculate the probability of drawing a red card from a standard deck of playing cards', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1);

-- Questions for Statistics Project (assignment_id = 10)
INSERT INTO questions (prompt, question_type, answer_1, answer_2, answer_3, answer_4, correct_choice_answer, created_date, last_updated, isActive)
VALUES
('Design a statistical study to investigate the average height of students in a school', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1),
('Interpret the results of a t-test and explain its significance in hypothesis testing', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1);

-- Questions for Number Theory Exploration (assignment_id = 11)
INSERT INTO questions (prompt, question_type, answer_1, answer_2, answer_3, answer_4, correct_choice_answer, created_date, last_updated, isActive)
VALUES
('Explain the fundamental theorem of arithmetic and its significance in number theory.', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1),
('Prove that there are infinitely many prime numbers using a proof by contradiction.', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1);

-- Questions for Diophantine Equations Assignment (assignment_id = 12)
INSERT INTO questions (prompt, question_type, answer_1, answer_2, answer_3, answer_4, correct_choice_answer, created_date, last_updated, isActive)
VALUES
('Solve the Diophantine equation 3x + 5y = 1 for integer solutions (x, y).', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1),
('Explain the concept of Diophantine equations and provide an example from real-world applications.', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1);

-- Questions for Multivariable Calculus Assignment (assignment_id = 13)
INSERT INTO questions (prompt, question_type, answer_1, answer_2, answer_3, answer_4, correct_choice_answer, created_date, last_updated, isActive)
VALUES
('Calculate the gradient of the function f(x, y, z) = x^2 + y^2 + z^2 at the point (1, -2, 3).', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1),
('Evaluate the line integral ∮C (xy + z^2) ds, where C is the curve defined by x = t^2, y = 2t, z = t^3, for t in [0, 1].', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1);

-- Questions for Applications of Calculus in Engineering (assignment_id = 14)
INSERT INTO questions (prompt, question_type, answer_1, answer_2, answer_3, answer_4, correct_choice_answer, created_date, last_updated, isActive)
VALUES
('Describe a practical engineering problem that can be modeled and solved using calculus.', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1),
('Explain how the concept of optimization is applied in engineering using calculus.', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1);

-- Questions for Ordinary Differential Equations Assignment (assignment_id = 15)
INSERT INTO questions (prompt, question_type, answer_1, answer_2, answer_3, answer_4, correct_choice_answer, created_date, last_updated, isActive)
VALUES
('Solve the first-order linear differential equation: dy/dx = 2x - 3.', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1),
('Explain the concept of an integrating factor and how it is used in solving differential equations.', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1);

-- Questions for Partial Differential Equations Project (assignment_id = 16)
INSERT INTO questions (prompt, question_type, answer_1, answer_2, answer_3, answer_4, correct_choice_answer, created_date, last_updated, isActive)
VALUES
('Propose and describe a real-world problem that can be modeled and solved using partial differential equations.', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1),
('Discuss the significance of boundary conditions in the context of solving partial differential equations.', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1);

-- Questions for Propositional Logic Assignment (assignment_id = 17)
INSERT INTO questions (prompt, question_type, answer_1, answer_2, answer_3, answer_4, correct_choice_answer, created_date, last_updated, isActive)
VALUES
('Define the basic connectives (AND, OR, NOT) in propositional logic and provide truth tables for each.', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1),
('Construct a truth table for the proposition: "If it is raining, then the ground is wet."', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1);

-- Questions for First-Order Logic Exploration (assignment_id = 18)
INSERT INTO questions (prompt, question_type, answer_1, answer_2, answer_3, answer_4, correct_choice_answer, created_date, last_updated, isActive)
VALUES
('Explain the concept of a first-order logic predicate and provide an example.', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1),
('Formulate a first-order logic statement to represent the assertion: "Every natural number is greater than 0."', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1);

-- Questions for Multivariable Calculus Assignment (assignment_id = 19)
INSERT INTO questions (prompt, question_type, answer_1, answer_2, answer_3, answer_4, correct_choice_answer, created_date, last_updated, isActive)
VALUES
('Calculate the divergence of the vector field F(x, y, z) = (x^2, y^2, z^2).', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1),
('Evaluate the surface integral ∬S F · dS, where F(x, y, z) = (x, y, z) and S is the surface of the unit sphere.', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1);

-- Questions for Applications of Calculus in Engineering (assignment_id = 20)
INSERT INTO questions (prompt, question_type, answer_1, answer_2, answer_3, answer_4, correct_choice_answer, created_date, last_updated, isActive)
VALUES
('Describe a practical engineering problem that can be modeled and solved using calculus.', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1),
('Explain how the concept of optimization is applied in engineering using calculus.', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1);

-- Questions for Shakespearean Play Analysis
INSERT INTO questions (prompt, question_type, answer_1, answer_2, answer_3, answer_4, correct_choice_answer, created_date, last_updated, isActive)
VALUES
('Discuss the main themes portrayed in the selected Shakespearean play.', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1),
('Examine the role of the main characters in the play and their significance.', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1);

-- Questions for Shakespearean Sonnet Exploration
INSERT INTO questions (prompt, question_type, answer_1, answer_2, answer_3, answer_4, correct_choice_answer, created_date, last_updated, isActive)
VALUES
('Choose a Shakespearean sonnet and analyze its structure and form.', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1),
('Explore the recurring themes in Shakespearean sonnets and provide examples.', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1);

-- Questions for Nature in Romantic Poetry
INSERT INTO questions (prompt, question_type, answer_1, answer_2, answer_3, answer_4, correct_choice_answer, created_date, last_updated, isActive)
VALUES
('Identify and analyze poems that depict nature in Romantic poetry.', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1),
('Discuss the influence of nature on the Romantic poets and their works.', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1);

-- Questions for Comparison of Romantic Poets
INSERT INTO questions (prompt, question_type, answer_1, answer_2, answer_3, answer_4, correct_choice_answer, created_date, last_updated, isActive)
VALUES
('Compare the literary styles of two Romantic poets of your choice.', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1),
('Examine how the historical context influenced the works of the selected poets.', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1);

-- Questions for Victorian Novel Analysis
INSERT INTO questions (prompt, question_type, answer_1, answer_2, answer_3, answer_4, correct_choice_answer, created_date, last_updated, isActive)
VALUES
('Select a Victorian novel and provide a detailed analysis of its plot and characters.', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1),
('Discuss the social and cultural aspects reflected in the chosen Victorian novel.', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1);

-- Questions for Social Themes in Victorian Literature
INSERT INTO questions (prompt, question_type, answer_1, answer_2, answer_3, answer_4, correct_choice_answer, created_date, last_updated, isActive)
VALUES
('Identify and analyze social themes prevalent in Victorian literature.', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1),
('Discuss the relevance of these social themes in contemporary society.', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1);

-- Questions for Modernist Movement Analysis
INSERT INTO questions (prompt, question_type, answer_1, answer_2, answer_3, answer_4, correct_choice_answer, created_date, last_updated, isActive)
VALUES
('Analyze the key characteristics of the modernist literary movement.', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1),
('Explore how modernist literature challenged traditional norms and styles.', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1);

-- Questions for Stream of Consciousness Writing
INSERT INTO questions (prompt, question_type, answer_1, answer_2, answer_3, answer_4, correct_choice_answer, created_date, last_updated, isActive)
VALUES
('Experiment with stream of consciousness writing and share your experience.', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1),
('Discuss the impact of stream of consciousness on narrative structure.', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1);

-- Questions for Post-Colonial Novel Study
INSERT INTO questions (prompt, question_type, answer_1, answer_2, answer_3, answer_4, correct_choice_answer, created_date, last_updated, isActive)
VALUES
('Select a post-colonial novel and provide a comprehensive study of its themes.', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1),
('Examine the cultural and historical context of the chosen post-colonial novel.', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1);

-- Questions for Cultural Identity in Post-Colonial Literature
INSERT INTO questions (prompt, question_type, answer_1, answer_2, answer_3, answer_4, correct_choice_answer, created_date, last_updated, isActive)
VALUES
('Explore the theme of cultural identity in post-colonial literature.', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1),
('Discuss how post-colonial authors represent cultural identity in their works.', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1);

-- Questions for Critical Analysis of a Literary Work
INSERT INTO questions (prompt, question_type, answer_1, answer_2, answer_3, answer_4, correct_choice_answer, created_date, last_updated, isActive)
VALUES
('Conduct a character analysis of the protagonist in the selected literary work.', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1),
('Discuss the use of symbolism in the chosen literary work and its impact on the narrative.', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1);

-- Questions for Application of Literary Theories
INSERT INTO questions (prompt, question_type, answer_1, answer_2, answer_3, answer_4, correct_choice_answer, created_date, last_updated, isActive)
VALUES
('Apply psychoanalytic literary theory to analyze a specific scene in the text.', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1),
('Discuss how the application of feminist literary theory can offer new insights into the chosen text.', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1);

-- Questions for Short Story Writing
INSERT INTO questions (prompt, question_type, answer_1, answer_2, answer_3, answer_4, correct_choice_answer, created_date, last_updated, isActive)
VALUES
('Create a brief outline for your short story, highlighting key plot points.', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1),
('Discuss the choice of narrative perspective in your short story and its effect on the reader.', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1);

-- Questions for Poetry Composition
INSERT INTO questions (prompt, question_type, answer_1, answer_2, answer_3, answer_4, correct_choice_answer, created_date, last_updated, isActive)
VALUES
('Compose an original poem exploring the theme of nature or love.', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1),
('Reflect on the use of figurative language and poetic devices in your composed poem.', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1);

-- Questions for Tragic Themes in Shakespearean Plays
INSERT INTO questions (prompt, question_type, answer_1, answer_2, answer_3, answer_4, correct_choice_answer, created_date, last_updated, isActive)
VALUES
('Examine how tragic themes are presented in the selected Shakespearean plays.', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1),
('Discuss the role of fate and destiny in contributing to the tragic outcomes in these plays.', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1);

-- Questions for Character Analysis in Tragedies
INSERT INTO questions (prompt, question_type, answer_1, answer_2, answer_3, answer_4, correct_choice_answer, created_date, last_updated, isActive)
VALUES
('Select a tragic character and provide a detailed analysis of their motivations and actions.', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1),
('Discuss how the flaws of tragic characters contribute to the overall tragedy in Shakespearean plays.', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1);

-- Questions for Modernist Poetry Exploration
INSERT INTO questions (prompt, question_type, answer_1, answer_2, answer_3, answer_4, correct_choice_answer, created_date, last_updated, isActive)
VALUES
('Analyze a modernist poem and discuss its departure from traditional poetic forms.', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1),
('Explore how modernist poets address themes of alienation and disillusionment in their works.', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1);

-- Questions for Performance Poetry Showcase
INSERT INTO questions (prompt, question_type, answer_1, answer_2, answer_3, answer_4, correct_choice_answer, created_date, last_updated, isActive)
VALUES
('Compose and perform a piece of performance poetry, considering the use of voice and body language.', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1),
('Discuss how the performance aspect enhances the impact of the modern poem on the audience.', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1);

-- Questions for Structuralism vs. Poststructuralism Debate
INSERT INTO questions (prompt, question_type, answer_1, answer_2, answer_3, answer_4, correct_choice_answer, created_date, last_updated, isActive)
VALUES
('Present arguments in favor of structuralism in the literary theory debate.', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1),
('Discuss the key principles of poststructuralism and their implications for literary analysis.', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1);

-- Questions for Application of Feminist Literary Criticism
INSERT INTO questions (prompt, question_type, answer_1, answer_2, answer_3, answer_4, correct_choice_answer, created_date, last_updated, isActive)
VALUES
('Apply feminist literary criticism to a selected text and analyze the representation of gender roles.', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1),
('Discuss how feminist literary criticism contributes to a deeper understanding of the chosen literary work.', 'text', NULL, NULL, NULL, NULL, NULL, GETUTCDATE(), NULL, 1);


-- Assign questions to Algebra Basics Assignment 1
INSERT INTO assignments_questions (assignment_id, question_id)
VALUES
(1, 1),
(1, 2);

-- Assign questions to Algebra Basics Assignment 2
INSERT INTO assignments_questions (assignment_id, question_id)
VALUES
(2, 3),
(2, 4);

-- Assign questions to Advanced Calculus Problems Set 1
INSERT INTO assignments_questions (assignment_id, question_id)
VALUES
(3, 5),
(3, 6);

-- Assign questions to Advanced Calculus Problems Set 2
INSERT INTO assignments_questions (assignment_id, question_id)
VALUES
(4, 7),
(4, 8);

-- Assign questions to Linear Algebra Assignment 1
INSERT INTO assignments_questions (assignment_id, question_id)
VALUES
(5, 9),
(5, 10);

-- Assign questions to Linear Algebra Assignment 2
INSERT INTO assignments_questions (assignment_id, question_id)
VALUES
(6, 11),
(6, 12);

-- Assign questions to Geometry Basics Assignment
INSERT INTO assignments_questions (assignment_id, question_id)
VALUES
(7, 13),
(7, 14);

-- Assign questions to Geometric Proofs Assignment
INSERT INTO assignments_questions (assignment_id, question_id)
VALUES
(8, 15),
(8, 16);

-- Assign questions to Probability Assignment
INSERT INTO assignments_questions (assignment_id, question_id)
VALUES
(9, 17),
(9, 18);

-- Assign questions to Statistics Project
INSERT INTO assignments_questions (assignment_id, question_id)
VALUES
(10, 19),
(10, 20);

-- Assign questions to Number Theory Exploration
INSERT INTO assignments_questions (assignment_id, question_id)
VALUES
(11, 21),
(11, 22);

-- Assign questions to Diophantine Equations Assignment
INSERT INTO assignments_questions (assignment_id, question_id)
VALUES
(12, 23),
(12, 24);

-- Assign questions to Multivariable Calculus Assignment
INSERT INTO assignments_questions (assignment_id, question_id)
VALUES
(13, 25),
(13, 26);

-- Assign questions to Applications of Calculus in Engineering
INSERT INTO assignments_questions (assignment_id, question_id)
VALUES
(14, 27),
(14, 28);

-- Assign questions to Ordinary Differential Equations Assignment
INSERT INTO assignments_questions (assignment_id, question_id)
VALUES
(15, 29),
(15, 30);

-- Assign questions to Partial Differential Equations Project
INSERT INTO assignments_questions (assignment_id, question_id)
VALUES
(16, 31),
(16, 32);

-- Assign questions to Propositional Logic Assignment
INSERT INTO assignments_questions (assignment_id, question_id)
VALUES
(17, 33),
(17, 34);

-- Assign questions to First-Order Logic Exploration
INSERT INTO assignments_questions (assignment_id, question_id)
VALUES
(18, 35),
(18, 36);

-- Assign questions to Multivariable Calculus Assignment
INSERT INTO assignments_questions (assignment_id, question_id)
VALUES
(19, 37),
(19, 38);

-- Assign questions to Applications of Calculus in Engineering
INSERT INTO assignments_questions (assignment_id, question_id)
VALUES
(20, 39),
(20, 40);

-- Assignments_Questions for Shakespearean Play Analysis
INSERT INTO assignments_questions (assignment_id, question_id)
VALUES
(21, 41),
(21, 42);

-- Assignments_Questions for Shakespearean Sonnet Exploration
INSERT INTO assignments_questions (assignment_id, question_id)
VALUES
(22, 43),
(22, 44);

-- Assignments_Questions for Nature in Romantic Poetry
INSERT INTO assignments_questions (assignment_id, question_id)
VALUES
(23, 45),
(23, 46);

-- Assignments_Questions for Comparison of Romantic Poets
INSERT INTO assignments_questions (assignment_id, question_id)
VALUES
(24, 47),
(24, 48);

-- Assignments_Questions for Victorian Novel Analysis
INSERT INTO assignments_questions (assignment_id, question_id)
VALUES
(25, 49),
(25, 50);

-- Assignments_Questions for Social Themes in Victorian Literature
INSERT INTO assignments_questions (assignment_id, question_id)
VALUES
(26, 51),
(26, 52);

-- Assignments_Questions for Modernist Movement Analysis
INSERT INTO assignments_questions (assignment_id, question_id)
VALUES
(27, 53),
(27, 54);

-- Assignments_Questions for Stream of Consciousness Writing
INSERT INTO assignments_questions (assignment_id, question_id)
VALUES
(28, 55),
(28, 56);

-- Assignments_Questions for Post-Colonial Novel Study
INSERT INTO assignments_questions (assignment_id, question_id)
VALUES
(29, 57),
(29, 58);

-- Assignments_Questions for Cultural Identity in Post-Colonial Literature
INSERT INTO assignments_questions (assignment_id, question_id)
VALUES
(30, 59),
(30, 60);

-- Assignments_Questions for Critical Analysis of a Literary Work
INSERT INTO assignments_questions (assignment_id, question_id)
VALUES
(31, 61),
(31, 62);

-- Assignments_Questions for Application of Literary Theories
INSERT INTO assignments_questions (assignment_id, question_id)
VALUES
(32, 63),
(32, 64);

-- Assignments_Questions for Short Story Writing
INSERT INTO assignments_questions (assignment_id, question_id)
VALUES
(33, 65),
(33, 66);

-- Assignments_Questions for Poetry Composition
INSERT INTO assignments_questions (assignment_id, question_id)
VALUES
(34, 67),
(34, 68);

-- Assignments_Questions for Tragic Themes in Shakespearean Plays
INSERT INTO assignments_questions (assignment_id, question_id)
VALUES
(35, 69),
(35, 70);

-- Assignments_Questions for Character Analysis in Tragedies
INSERT INTO assignments_questions (assignment_id, question_id)
VALUES
(36, 71),
(36, 72);

-- Assignments_Questions for Modernist Poetry Exploration
INSERT INTO assignments_questions (assignment_id, question_id)
VALUES
(37, 73),
(37, 74);

-- Assignments_Questions for Performance Poetry Showcase
INSERT INTO assignments_questions (assignment_id, question_id)
VALUES
(38, 75),
(38, 76);

-- Assignments_Questions for Structuralism vs. Poststructuralism Debate
INSERT INTO assignments_questions (assignment_id, question_id)
VALUES
(39, 77),
(39, 78);

-- Assignments_Questions for Application of Feminist Literary Criticism
INSERT INTO assignments_questions (assignment_id, question_id)
VALUES
(40, 79),
(40, 80);




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
