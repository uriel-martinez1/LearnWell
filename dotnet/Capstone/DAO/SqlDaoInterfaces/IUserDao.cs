using System.Collections.Generic;
using Capstone.Models;

namespace Capstone.DAO.SqlDaoInterfaces
{
    public interface IUserDao
    {
        IList<User> GetUsers();
        User GetUserById(int id);
        User GetUserByUsername(string username);
        User CreateUser(string firstName, string lastName, string email, string username, string password, string role, string teacherKey);
    }
}
