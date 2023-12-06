namespace Capstone.DAO
{
    public class CourseSqlDao
    {

        private readonly string connectionString;

        public CourseSqlDao(string connString)
        {
            connectionString = connString;
        }

    }
}
