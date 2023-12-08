using System.Collections.Generic;
using System.Data.SqlClient;
using Capstone.Models;

namespace Capstone.DAO.SqlDaoInterfaces
{
    public interface IUserDao
    {
        IList<User> GetUsers();
        List<User> GetStudentsByTeacherId(int id);
        User GetUserById(int id);
        User GetUserByUsername(string username);
        User CreateUser(string firstName, string lastName, string email, string username, string password, string role, string teacherKey);
        User MapRowToUser(SqlDataReader reader);
    }
}
