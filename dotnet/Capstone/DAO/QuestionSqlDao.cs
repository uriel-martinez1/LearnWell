using Capstone.DAO.SqlDaoInterfaces;
using Capstone.Models;
using System.Collections.Generic;

namespace Capstone.DAO
{
    public class QuestionSqlDao : IQuestionDao
    {

        private readonly string connectionString;

        public QuestionSqlDao(string connString)
        {
            connectionString = connString;
        }

    }
}
