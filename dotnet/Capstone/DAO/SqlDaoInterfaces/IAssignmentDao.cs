using Capstone.Models;
using Capstone.Models.NewFolder;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace Capstone.DAO.SqlDaoInterfaces
{
    public interface IAssignmentDao
    {

        List<Assignment> GetAssignmentsByCurriculumElementId(int id);
        Assignment GetAssignmentByAssignmentId(int assignmentId);
        List<Assignment> GetAssignmentsByCourseId(int id);
        List<int> AddAssignmentsByCurriculumElement(CurriculumElementDTO incoming, int curriculumElementId);
        CompleteAssignment GetCompleteAssignmentsWithQuestions(CurriculumElementDTO incoming, Assignment incomingAssignment, IQuestionDao questionDao, int assignmentIndex);
        Assignment MapRowToAssignment(SqlDataReader reader);

    }
}
