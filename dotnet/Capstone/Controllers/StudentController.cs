using Microsoft.AspNetCore.Mvc;
using Capstone.DAO;
using Capstone.Exceptions;
using Capstone.Models;
using Capstone.Security;
using Microsoft.AspNetCore.Authorization;
using System.Collections.Generic;
using System.Security.Cryptography.Xml;
using System.Security.Principal;
using Capstone.DAO.SqlDaoInterfaces;

namespace Capstone.Controllers
{
    [Route("student")]
    [ApiController]
    [Authorize]
    public class StudentController : ControllerBase
    {
        private readonly IAssignmentDao assignmentDao;
        private readonly ICourseDao courseDao;
        private readonly IUserDao userDao;
        private readonly ICurriculumElementDao curriculumElementDao;
        private readonly IQuestionDao questionDao;

        
        public StudentController(ICourseDao courseDao, IUserDao userDao, ICurriculumElementDao curriculumElementDao, IAssignmentDao assignmentDao, IQuestionDao questionDao)
        {
            //this.dashboardDao = dashboardDao;
            this.courseDao = courseDao;
            this.userDao = userDao;
            this.curriculumElementDao = curriculumElementDao;
            this.assignmentDao = assignmentDao;
            this.questionDao = questionDao;
        }

        [HttpGet("{id}")]
        public ActionResult<User> GetUserData(int id)
        {
            try
            {
                User output = userDao.GetUserById(id);
                return Ok(output);
            }
            catch (System.Exception)
            {
                return NotFound();
            }
        }
        [HttpGet("{id}/courses")]
        public ActionResult<List<Course>> GetCoursesByStudentId(int id)
        {
            try
            {
                List<Course> outputList = courseDao.GetCoursesByStudentId(id);
                return Ok(outputList);

            }
            catch (System.Exception)
            {
                return NotFound();
            }
        }
        [HttpGet("courses/{courseId}")]
        public ActionResult<Course> GetCourseByCourseId(int courseId)
        {
            try
            {
                Course output = courseDao.GetCourseByCourseId(courseId);
                return Ok(output);

            }
            catch (System.Exception)
            {
                return NotFound();
            }
        }
        [HttpGet("courses/curriculum/{courseId}")]
        public ActionResult<List<CurriculumElement>> GetCurriculumByCourseId(int courseId)
        {
            try
            {
                List<CurriculumElement> curriculum = curriculumElementDao.GetCurriculumElementsByCourse(courseId);
                return Ok(curriculum);

            }
            catch (System.Exception)
            {
                return NotFound();
            }
        }

        [HttpGet("{id}/assignments")]

        public ActionResult<List<Assignment>> GetAssignments(int id)
        {
            try
            {
                List<Assignment> outputList = assignmentDao.GetAssignmentsByCurriculumElementId(id);
                return Ok(outputList);

            }
            catch (System.Exception)
            {
                return NotFound();
            }
        }

        [HttpGet("assignments/{id}/questions")]

        public ActionResult<List<Question>> GetQuestionsByAssignmentId(int id)
        {
            try
            {
                List<Question> outputList = questionDao.GetQuestionsByAssignmentId(id);
                return Ok(outputList);

            }
            catch (System.Exception)
            {
                return NotFound();
            }
        }

        //        [HttpGet("{courseId}/assignments/{assignmentId}")]

        //        public ActionResult<Assignment> GetAssignmentById(int assignmentId)
        //        {
        //            try
        //            {
        //                Assignment output = AssignmentDao.GetAssignmentByAssignmentId(assignmentId);
        //                return Ok(output);

        //            }
        //            catch (System.Exception)
        //            {
        //                return NotFound();
        //            }
        //        }
        //        //path: '/student/course/:CourseId/assigment/:AssignmentId?Action=edit'
        //        //[HttpPost"courses/{courseId}/assignments/{assignmentId}"]
        //        //public ActionResult<Assignment> AddAssignment(Assignment assignment)
        //        //{
        //        //    Assignment addedAssignment = assignmentDao.CreateAssignment(assignment);
        //        //    return Created($"/courses/)
        //        //}

    }
}