using Capstone.Models;
using Capstone.Models.NewFolder;
using System.Collections.Generic;

namespace Capstone.DAO.SqlDaoInterfaces
{
    public interface ISourceDao
    {
        List<Source> GetSourcesByCurriculumElement(int elementId);
        List<int> AddSourcesByCurriculumElement(CurriculumElementDTO incoming, int curriculumElementId);

    }
}
