using Capstone.Exceptions;
using Capstone.Models;
using System.Collections.Generic;
using System.Data.SqlClient;
using System;
using Capstone.DAO.SqlDaoInterfaces;
using Capstone.Models.DTO_s;

namespace Capstone.DAO
{
    public class AnswerSqlDao: IAnswerDao
    {

        private readonly string connectionString;

        public AnswerSqlDao(string connString)
        {
            connectionString = connString;
        }
        public List<Answer> GetAnswersBySubmitedAssignmentId(int submitedAssignmentId)
        {
            List<Answer> answers = new List<Answer>();

            string sql = "SELECT answer_id, submitted_assignment_id, question_type, answer_choice, answer_text, "
            + " answer_external, isCorrect, last_updated, number_of_edits FROM answers " +
            "WHERE submited_assignment_id = @submitedAssignmentId;";

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@submitedAssignmentId", submitedAssignmentId);
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
        
        public Answer GetAnswerByAnswerId(int answerId)
        {
            Answer answer = new Answer();

            string sql = "SELECT answer_id, submitted_assignment_id, question_type, answer_choice, answer_text, "
            + " answer_external, isCorrect, last_updated, number_of_edits FROM answers " +
            "WHERE answer_id = @answerId;";

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@answerId", answerId);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        answer = MapRowToAnswer(reader);

                    }
                }
            }
            catch (SqlException ex)
            {
                throw new DaoException("SQL exception occurred", ex);
            }

            return answer;
        }

        //GetAnswerByQuestionId
        public Answer GetAnswerByQuestionId(int questionId)
        {
            Answer answer = null;

            string sql = "SELECT answer_id, submitted_assignment_id, question_type, answer_choice, answer_text, " +
                "answer_external, isCorrect, last_updated, number_of_edits FROM answers " +
                "WHERE question_id = @questionId;";

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@questionId", questionId);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        answer = MapRowToAnswer(reader);

                    }
                }
            }
            catch (SqlException ex)
            {
                throw new DaoException("SQL exception occurred", ex);
            }

            return answer;
        }       
        //public Answer GetAnswerByQuestionAndAssignmentId(int questionId, int assignmentId) //TODO I think this is the right way
        //{
        //    Answer answer = null;

        //    string sql = "SELECT answer_id, submitted_assignment_id, question_type, answer_choice, answer_text, " +
        //        "answer_external, isCorrect, last_updated, number_of_edits FROM answers " +
        //        "WHERE submitted_assignment_id = @assignmentId and question_id = @questionId) or (submitted_assignment_id = @assignmentId and question_id = @questionId;";
           
        //    try
        //    {
        //        using (SqlConnection conn = new SqlConnection(connectionString))
        //        {
        //            conn.Open();

        //            SqlCommand cmd = new SqlCommand(sql, conn);
        //            cmd.Parameters.AddWithValue("@questionId", questionId);
        //            cmd.Parameters.AddWithValue("@assignmentId", assignmentId);
        //            SqlDataReader reader = cmd.ExecuteReader();

        //            if (reader.Read())
        //            {
        //                answer = MapRowToAnswer(reader);

        //            }
        //        }
        //    }
        //    catch (SqlException ex)
        //    {
        //        throw new DaoException("SQL exception occurred", ex);
        //    }

        //    return answer;
        //}
        public Answer AddSubmittedAnswer(Answer answer)
        {
            Answer outputAnswer = new Answer();
            int output = 0;

            string sql = "INSERT INTO answers (submitted_assignment_id, question_id, question_type, answer_text) " +
                "OUTPUT INSERTED.answer_id AS id " +
                "VALUES (@submittedassignmentId, @questionId, @questiontype, @answertext)";
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@submittedassignmentId", answer.SubmittedAssignmentId);
                    cmd.Parameters.AddWithValue("@questionId", answer.QuestionId);
                    cmd.Parameters.AddWithValue("@questiontype", answer.QuestionType);
                    cmd.Parameters.AddWithValue("@answertext", answer.AnswerText);

                    output = Convert.ToInt32(cmd.ExecuteScalar());
                }
                outputAnswer = GetAnswerByAnswerId(output);
            }
            catch (SqlException ex)
            {
                throw new DaoException("SQL exception occurred", ex);
            }
            return outputAnswer;
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

        public Answer GetAnswerByQuestionAndAssignmentId(int questionId, int assignmentId)
        {
            throw new NotImplementedException();
        }
    }
}