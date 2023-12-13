using Capstone.DAO.SqlDaoInterfaces;
using Capstone.Exceptions;
using Capstone.Models;
using Capstone.Models.NewFolder;
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
                    cmd.Parameters.AddWithValue("@courseId", courseId);
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

        public CurriculumElement GetCurriculumElementByCurriculumId(int id)
        {
            CurriculumElement output = null;

            string sql = "SELECT curriculum_element_id, course_id, course_order, description, lecture_content, created_date, last_updated " +
                "FROM curriculum_elements " +
                "WHERE curriculum_element_id = @id;";
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@id", id);
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        output = MapRowToCurriculumElement(reader);
                    }
                }
            }
            catch (SqlException ex)
            {
                throw new DaoException("SQL exception occurred", ex);
            }
            return output;
        }

        public CompleteCurriculumElement AddCompleteCurriculumElement(CurriculumElementDTO incoming, ISourceDao sourceDao, IAssignmentDao assignmentDao, IQuestionDao questionDao)
        {
            CompleteCurriculumElement output = new CompleteCurriculumElement();


            int insertedCurriculumId = AddCurriculumElement(incoming);
            CurriculumElement insertedCurriculumElementBase = GetCurriculumElementByCurriculumId(insertedCurriculumId);
            List<int> insertedSourceIds = sourceDao.AddSourcesByCurriculumElement(incoming, insertedCurriculumId);
            List<Source> insertedSources = sourceDao.GetSourcesByCurriculumElement(insertedCurriculumId);
            List<int> insertedAssignmentIds = assignmentDao.AddAssignmentsByCurriculumElement(incoming, insertedCurriculumId);
            List<Assignment> insertedAssignments = assignmentDao.GetAssignmentsByCurriculumElementId(insertedCurriculumId);
            List<CompleteAssignment> completeAssignments = new List<CompleteAssignment>();
            for(int i=0; i<insertedAssignments.Count; i++)
            {
                completeAssignments.Add(assignmentDao.GetCompleteAssignmentsWithQuestions(incoming, insertedAssignments[i], questionDao, i));
            }


            output.CourseId = insertedCurriculumElementBase.CourseId;
            output.CourseOrder = insertedCurriculumElementBase.CourseOrder;
            output.CreatedDate = insertedCurriculumElementBase.CreatedDate;
            output.CurriculumElementId = insertedCurriculumElementBase.CurriculumElementId;
            output.Description = insertedCurriculumElementBase.Description;
            output.LastUpdated = insertedCurriculumElementBase.LastUpdated;
            output.LectureContent = insertedCurriculumElementBase.LectureContent;
            output.Sources = insertedSources;
            output.Assignments = completeAssignments;


            
            return output;
        }

        private int AddCurriculumElement(CurriculumElementDTO incoming)
        {
            int output = 0;

            string sql = "INSERT INTO curriculum_elements (course_id, course_order, description, lecture_content) " +
                "OUTPUT INSERTED.curriculum_element_id AS curriculumElementId " +
                "VALUES (@courseId, 0, @description, @lectureContent);";

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {

                    conn.Open();
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@courseId", incoming.courseId);
                    cmd.Parameters.AddWithValue("@description", incoming.description);
                    cmd.Parameters.AddWithValue("@lectureContent", incoming.lectureContent);

                    try
                    {
                        output = Convert.ToInt32(cmd.ExecuteScalar());
                    }
                    catch (SqlException ex)
                    {
                        throw new DaoException("SQL exception occurred", ex);
                    }

                }
            }
            catch (SqlException ex)
            {
                throw new DaoException("SQL exception occurred", ex);
            }

            return output;
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
