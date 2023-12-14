using Capstone.DAO.SqlDaoInterfaces;
using Capstone.Exceptions;
using Capstone.Models;
using Capstone.Models.NewFolder;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace Capstone.DAO
{
    public class AssignmentSqlDao : IAssignmentDao
    {

        private readonly string connectionString;

        public AssignmentSqlDao(string connString)
        {
            connectionString = connString;
        }

        public List<Assignment> GetAssignmentsByCurriculumElementId(int id)
        {

            List<Assignment> assignments = new List<Assignment>();

            string sql = "SELECT assignment_id, curriculum_element_id, title, description, assignment_type, created_date, last_updated " +
                "FROM assignments WHERE curriculum_element_id = @id;";

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
                        Assignment currAssignment = MapRowToAssignment(reader);
                        assignments.Add(currAssignment);
                    }

                }
            }
            catch (SqlException ex)
            {
                throw new DaoException("SQL exception occurred", ex);
            }

            return assignments;

        }

        public List<Assignment> GetAssignmentsByCourseId(int id)
        {
            List<Assignment> assignments = new List<Assignment>();

            string sql = "SELECT assignment_id, assignments.curriculum_element_id, title, assignments.description, assignment_type, assignments.created_date, assignments.last_updated " +
                "FROM assignments " +
                "JOIN curriculum_elements on curriculum_elements.curriculum_element_id = assignments.curriculum_element_id " +
                "JOIN courses on courses.course_id = curriculum_elements.course_id " +
                "WHERE courses.course_id = @id;";

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
                        Assignment currAssignment = MapRowToAssignment(reader);
                        assignments.Add(currAssignment);
                    }

                }
            }
            catch (SqlException ex)
            {
                throw new DaoException("SQL exception occurred", ex);
            }

            return assignments;
        }

        public List<int> AddAssignmentsByCurriculumElement(CurriculumElementDTO incoming, int curriculumElementId)
        {

            List<int> assignments = new List<int>();

            string sql = "INSERT INTO assignments(curriculum_element_id, title, description, assignment_type) " +
                "OUTPUT INSERTED.assignment_id AS sourceId " +
                "VALUES (@curriculumElementId, @title, @description, @assignmentType);";

            incoming.assignments.ForEach((element) =>
            {
                try
                {
                    using (SqlConnection conn = new SqlConnection(connectionString))
                    {
                        conn.Open();

                        SqlCommand cmd = new SqlCommand(sql, conn);
                        cmd.Parameters.AddWithValue("@curriculumElementId", curriculumElementId);
                        cmd.Parameters.AddWithValue("@title", element.title);
                        cmd.Parameters.AddWithValue("@description", element.description);
                        cmd.Parameters.AddWithValue("@assignmentType", element.assignmentType);

                        assignments.Add(Convert.ToInt32(cmd.ExecuteScalar()));

                    }
                }
                catch (SqlException ex)
                {
                    throw new DaoException("SQL exception occurred", ex);
                }
            });

            return assignments;
        }

        public CompleteAssignment GetCompleteAssignmentsWithQuestions(CurriculumElementDTO incoming, Assignment incomingAssignment, IQuestionDao questionDao, int assignmentIndex)
        {
            CompleteAssignment assignment = new CompleteAssignment();

            assignment.AssignmentId = incomingAssignment.AssignmentId;
            assignment.AssignmentType = incomingAssignment.AssignmentType;
            assignment.CreatedDate = incomingAssignment.CreatedDate;
            assignment.CurriculumElementId = incomingAssignment.CurriculumElementId;
            assignment.Description = incomingAssignment.Description;
            assignment.LastUpdated = incomingAssignment.LastUpdated;
            assignment.Title = incomingAssignment.Title;
            try
            {
                List<int> questionIds = questionDao.AddQuestionsByAssignmentId(incoming, incomingAssignment.AssignmentId, assignmentIndex);
                List<Question> questions = questionDao.GetQuestionsByAssignmentId(incomingAssignment.AssignmentId); ;
                assignment.Questions = questions;
            }
            catch (SqlException ex)
            {
                throw new DaoException("SQL exception occurred", ex);
            }


            return assignment;
        }

        //TODO add assignment method
        //TODO edit assignment method
        //TODO delete assignment method

        public Assignment MapRowToAssignment(SqlDataReader reader)
        {
            Assignment returnAssignment = new Assignment();

            returnAssignment.AssignmentId = Convert.ToInt32(reader["assignment_id"]);
            returnAssignment.CurriculumElementId = Convert.ToInt32(reader["curriculum_element_id"]);
            returnAssignment.Title = Convert.ToString(reader["title"]);
            returnAssignment.Description = Convert.ToString(reader["description"]);
            returnAssignment.AssignmentType = Convert.ToString(reader["assignment_type"]);
            returnAssignment.CreatedDate = Convert.ToDateTime(reader["created_date"]);
            returnAssignment.LastUpdated = SqlUtil.NullableDateTime(reader["last_updated"]);

            return returnAssignment;
        }
    }
}
