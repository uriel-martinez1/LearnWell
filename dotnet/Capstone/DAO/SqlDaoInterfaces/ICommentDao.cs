using Capstone.Models;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace Capstone.DAO.SqlDaoInterfaces
{
    public interface ICommentDao
    {
        public List<Comment> GetCommentsByUserId(int studentId);

        public List<Comment> GetCommentsByUserId(int studentId, int teacherId);
        public Comment MapRowToComment(SqlDataReader reader);
    }
}
