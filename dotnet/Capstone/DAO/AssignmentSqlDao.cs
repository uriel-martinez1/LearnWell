using Capstone.DAO.SqlDaoInterfaces;
using Capstone.Exceptions;
using Capstone.Models;
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
