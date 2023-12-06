//using Microsoft.AspNetCore.Mvc;
//using Capstone.DAO;
//using Capstone.Exceptions;
//using Capstone.Models;
//using Capstone.Security;
//using Microsoft.AspNetCore.Authorization;
//using System.Collections.Generic;
//using System.Security.Cryptography.Xml;
//using System.Security.Principal;

//namespace Capstone.Controllers
//{
//    [Route("[controller]")]
//    [ApiController]
//    [Authorize]
//    public class StudentController : ControllerBase
//    {
//        private readonly IAssignmentDao assignmentDao;
//        private readonly ICourseDao courseDao;
//        public StudentController(ICourseDao courseDao, IassignmentDao asignmentDao)
//        {
//            //this.dashboardDao = dashboardDao;
//            this.courseDao = courseDao;
//            this.assignmentDao = assignmentDao;
//        }
//        //[HttpGet]
//        //public ActionResult<Dashboard> GetDashboardByUser()
//        //{

//        //}
//        [HttpGet("courses")]
//        public ActionResult<List<Course>> GetCoursesByUsername()
//        {
//            try
//            {
//                List<Course> outputList = CourseDao.GetCoursesByUserName(User.Identity.Name);
//                return Ok(outputList);

//            }
//            catch (System.Exception)
//            {
//                return NotFound();
//            }
//        }
//        [HttpGet("courses/{courseId}")]
//        public ActionResult<Course> GetCourseByCourseId(int courseId)
//        {
//            try
//            {
//                Course output = CourseDao.GetCourseByCourseId(courseId);
//                return Ok(output);

//            }
//            catch (System.Exception)
//            {
//                return NotFound();
//            }
//        }

//        [HttpGet("{courseId}/assignments")]

//        public ActionResult<List<Assignment>> GetAssignments(int courseId)
//        {
//            try
//            {
//                List<Assignment> outputList = AssignmentDao.GetAssignmentsByCourseId(courseId);
//                return Ok(outputList);

//            }
//            catch (System.Exception)
//            {
//                return NotFound();
//            }
//        }
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

//    }
//}