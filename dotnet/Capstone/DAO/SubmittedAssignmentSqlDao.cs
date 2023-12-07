using Capstone.Models;
using System.Collections.Generic;
using System;
using System.Data.SqlClient;
using Capstone.Exceptions;
using Capstone.DAO.SqlDaoInterfaces;

namespace Capstone.DAO
{
    public class SubmittedAssignmentSqlDao : ISubmittedAssignmentDao
    {
        private CommentSqlDao commentDao;
        private AnswerSqlDao answerDao;

        private readonly string connectionString;
        public SubmittedAssignmentSqlDao(string dbConnectionString)
        {
            connectionString = dbConnectionString;
        }
        public List<SubmittedAssignment> GetSubmittedAssignmentsByAssignmentId(int assignmentId)
        {
            List<SubmittedAssignment> submittedAssignments = new List<SubmittedAssignment>();

            string sql = "SELECT submitted_assignment_id, assignment_id, student_id, teacher_id, course_id, score, graded_date, "
            + " created_date, last_updated, number_of_edits FROM submitted_assignments "
             + " WHERE assignment_id = @assignment_id";
            
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@assignment_id", assignmentId);
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        SubmittedAssignment individualsubmittedAssignment = MapRowToSubmittedAssignment(reader);
                        submittedAssignments.Add(individualsubmittedAssignment);

                    }
                }
            }
            catch (SqlException ex)
            {
                throw new DaoException("SQL exception occurred", ex);
            }

            return submittedAssignments;
        }
        public SubmittedAssignment MapRowToSubmittedAssignment(SqlDataReader reader)
        {
            SubmittedAssignment assignment = new SubmittedAssignment();
            assignment.SubmittedAssignmentId = Convert.ToInt32(reader["submitted_assignment_id"]);
            assignment.AssignmentId = Convert.ToInt32(reader["assignment_id"]);
            assignment.StudentId = Convert.ToInt32(reader["student_id"]);
            assignment.TeacherId = Convert.ToInt32(reader["teacher_id"]);
            assignment.CourseId = Convert.ToInt32(reader["course_id"]);
            assignment.Score = Convert.ToInt32(reader["score"]);
            assignment.GradedDate = SqlUtil.NullableDateTime(reader["graded_date"]);
            assignment.CreatedDate = Convert.ToDateTime(reader["created_date"]);
            assignment.LastEdited = SqlUtil.NullableDateTime(reader["last_updated"]);
            assignment.NumberOfEdits = Convert.ToInt32(reader["number_of_edits"]);
            assignment.Answers = answerDao.GetAnswersBySubmitedAssignmentId(assignment.SubmittedAssignmentId);
            assignment.Comments = commentDao.GetCommentsByUserId(assignment.StudentId,assignment.TeacherId);
            return assignment;
        }
    }
}