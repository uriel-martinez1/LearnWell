using Capstone.DAO.SqlDaoInterfaces;
using Capstone.Exceptions;
using Capstone.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace Capstone.DAO
{
    public class CurriculumElementSqlDao : ICurriculumElementDao
    {
        private readonly string connectionString;
        public CurriculumElementSqlDao(string dbConnectionString)
        {
            connectionString = dbConnectionString;
        }
        public List<CurriculumElement> GetCurriculumElementsByCourse(int courseId)
        {
            List<CurriculumElement> curriculum = new List<CurriculumElement>();

            string sql = "SELECT curriculum_element_id, course_id, course_order, description, lecture_content, " +
                "created_date, last_updated "
                    + " FROM curriculum_elements WHERE course_id = @courseId;";

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@course_id", courseId);
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        CurriculumElement individualCurriculum = MapRowToCurriculumElement(reader);
                        curriculum.Add(individualCurriculum);

                    }
                }
            }
            catch (SqlException ex)
            {
                throw new DaoException("SQL exception occurred", ex);
            }

            return curriculum;
        }
        public CurriculumElement MapRowToCurriculumElement(SqlDataReader reader)
        {
            CurriculumElement curriculum = new CurriculumElement();
            curriculum.CurriculumElementId = Convert.ToInt32(reader["curriculum_element_id"]);
            curriculum.CourseId = Convert.ToInt32(reader["course_id"]);
            curriculum.CourseOrder = Convert.ToInt32(reader["course_order"]);
            curriculum.Description = Convert.ToString(reader["description"]);
            curriculum.LectureContent = Convert.ToString(reader["lecture_content"]);
            curriculum.CreatedDate = Convert.ToDateTime(reader["created_date"]);
            curriculum.LastUpdated = SqlUtil.NullableDateTime(reader["last_updated"]);
            //curriculum.isactive = Convert.ToInt32(reader["is_active"]);
            return curriculum;
        }
    }
}
