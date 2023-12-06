using Capstone.Exceptions;
using Capstone.Models;
using System.Collections.Generic;
using System.Data.SqlClient;
using System;
using Capstone.DAO.SqlDaoInterfaces;

namespace Capstone.DAO
{
    public class AnswerSqlDao: IAnswerDao
    {

        private readonly string connectionString;

        public AnswerSqlDao(string connString)
        {
            connectionString = connString;
        }
        public List<Answer> GetAnswersByStudentId(int studentId)
        {
            List<Answer> answers = new List<Answer>();

            string sql = "select answer_id, submitted_assignment_id, question_type, answer_choice, answer_text, "
            + " answer_external, isCorrect, last_updated, number_of_edits from answers " +
            "where submitted_assignment_id = @student_id";

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@student_id", studentId);
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        Answer individualAnswer = MapRowToAnswer(reader);
                        answers.Add(individualAnswer);

                    }
                }
            }
            catch (SqlException ex)
            {
                throw new DaoException("SQL exception occurred", ex);
            }

            return answers;
        }

        public Answer MapRowToAnswer(SqlDataReader reader)
        {
            Answer answer = new Answer();
            answer.AnswerId = Convert.ToInt32(reader["answer_id"]);
            answer.SubmittedAssignmentId = Convert.ToInt32(reader["submitted_assignment_id"]);
            answer.QuestionType = Convert.ToString(reader["question_type"]);
            answer.AnswerChoice = SqlUtil.NullableInt(reader["answer_choice"]);
            answer.AnswerText = Convert.ToString(reader["answer_text"]);
            answer.AnswerExternal = SqlUtil.NullableString(reader["answer_external"]);
            answer.IsCorrect = Convert.ToBoolean(reader["IsCorrect"]);
            answer.LastUpdated = SqlUtil.NullableDateTime(reader["last_updated"]);
            answer.NubmerOfEdits = Convert.ToInt32(reader["number_of_edits"]);
            return answer;
        }
    }
}