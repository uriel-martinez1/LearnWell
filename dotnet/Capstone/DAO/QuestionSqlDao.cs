using Capstone.DAO.SqlDaoInterfaces;
using Capstone.Exceptions;
using Capstone.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace Capstone.DAO
{
    public class QuestionSqlDao : IQuestionDao
    {

        private readonly string connectionString;

        public QuestionSqlDao(string connString)
        {
            connectionString = connString;
        }

        public List<Question> GetQuestionsByAssignmentId(int id)
        {
            List<Question> questions = new List<Question>();
            string sql = "SELECT questions.question_id, prompt, questions.question_type, " +
                "answer_1, answer_2, answer_3, answer_4, " +
                "correct_choice_answer, questions.created_date, questions.last_updated FROM questions " +
                "JOIN assignments_questions ON questions.question_id = assignments_questions.question_id " +
                "WHERE assignments_questions.assignment_id = @id";

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {

                    conn.Open();

                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@id", id);

                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        Question newQuestion = MapRowToQuestion(reader);
                        questions.Add(newQuestion);
                    }

                }
            }
            catch (SqlException ex)
            {
                throw new DaoException("SQL exception occurred", ex);
            }

            return questions;
        }

        //TODO add question method
        //TODO edit question method
        //TODO delete question method

        public Question MapRowToQuestion(SqlDataReader reader)
        {
            Question newQuestion = new Question();

            newQuestion.QuestionId = Convert.ToInt32(reader["question_id"]);
            newQuestion.Prompt = Convert.ToString(reader["prompt"]);
            newQuestion.QuestionType = Convert.ToString(reader["question_type"]);
            newQuestion.Answer1 = SqlUtil.NullableString(reader["answer_1"]);
            newQuestion.Answer2 = SqlUtil.NullableString(reader["answer_2"]);
            newQuestion.Answer3 = SqlUtil.NullableString(reader["answer_3"]);
            newQuestion.Answer4 = SqlUtil.NullableString(reader["answer_4"]);
            newQuestion.CorrectChoiceAnswer = SqlUtil.NullableInt(reader["correct_choice_answer"]);
            newQuestion.CreatedDate = Convert.ToDateTime(reader["created_date"]);
            newQuestion.LastUpdated = SqlUtil.NullableDateTime(reader["last_updated"]);


            return newQuestion;
        }

    }
}
