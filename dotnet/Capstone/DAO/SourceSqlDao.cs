using Capstone.DAO.SqlDaoInterfaces;
using Capstone.Exceptions;
using Capstone.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace Capstone.DAO
{
    public class SourceSqlDao : ISourceDao
    {
        private readonly string connectionString;
        public SourceSqlDao(string dbConnectionString)
        {
            connectionString = dbConnectionString;
        }
        public List<Source> GetSourcesByCurriculumElement(int elementId)
        {
            List<Source> sources = new List<Source>();

            string sql = "SELECT source_id, curriculum_element_id, source_url, created_date, last_updated "
                    + "FROM sources WHERE curriculum_element_id = @curriculum_element_id;";

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@curriculum_element_id", elementId);
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        Source individualSource = MapRowToSource(reader);
                        sources.Add(individualSource);

                    }
                }
            }
            catch (SqlException ex)
            {
                throw new DaoException("SQL exception occurred", ex);
            }

            return sources;
        }
        public Source MapRowToSource(SqlDataReader reader)
        {
            Source source = new Source();
            source.SourceId = Convert.ToInt32(reader["source_id"]);
            source.CurriculumElementId = Convert.ToInt32(reader["curriculum_element_id"]);
            source.SourceUrl = Convert.ToString(reader["source_url"]);
            source.CreatedDate = Convert.ToDateTime(reader["created_date"]);
            source.LastUpdated = SqlUtil.NullableDateTime(reader["last_updated"]);
            //source.isactive = Convert.ToInt32(reader["is_active"]);
            return source;
        }
    }
}