using Capstone.Models;
using System.Collections.Generic;

namespace Capstone.DAO.SqlDaoInterfaces
{
    public interface ISourceDao
    {
        List<Source> GetSourcesByCurriculumElement(int elementId);
    }
}
