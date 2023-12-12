using Microsoft.AspNetCore.Mvc;
using Capstone.Exceptions;
using Capstone.Models;
using Capstone.Security;
using Microsoft.AspNetCore.Authorization;
using System.Collections.Generic;
using Capstone.DAO.SqlDaoInterfaces;
using Capstone.DAO;

namespace Capstone.Controllers
{
    [Route("teacher")]
    [ApiController]
   // [Authorize]
    public class TeacherController : ControllerBase
    {
        private readonly IUserDao UserDao;
        private readonly IAssignmentDao AssignmentDao;
        private readonly ICourseDao CourseDao;
        private readonly ICurriculumElementDao CurriculumElementDao;
        //private readonly INotificationDao NotificationDao;
        private readonly ISourceDao SourceDao;


        public TeacherController(IUserDao userDao, ICourseDao courseDao, ICurriculumElementDao curriculumElementDao, ISourceDao sourceDao, IAssignmentDao assignmentDao)
        {
            //this.dashboardDao = dashboardDao;
            UserDao = userDao;
            AssignmentDao = assignmentDao;
            CourseDao = courseDao;
            CurriculumElementDao = curriculumElementDao;
            //this.NotificationDao = notificationDao;
            SourceDao = sourceDao;

        }

        [HttpGet("{id}")]
        public ActionResult<User> GetUserData(int id)
        {
            try
            {
                User output = UserDao.GetUserById(id);
                return Ok(output);
            }
            catch (System.Exception)
            {
                return NotFound();
            }
        }

        [HttpGet("{id}/students")]
        public ActionResult<List<User>> GetStudentsByTeacherId(int id)
        {
            try
            {
                List<User> Listoutput = UserDao.GetStudentsByTeacherId(id);
                return Ok(Listoutput);

            }
            catch (System.Exception)
            {
                return NotFound();
            }
        }

        [HttpGet("students/{username}/courses")]
        public ActionResult<List<Course>> GetCoursesByUsername(string username)
        {
            try
            {
                List<Course> outputList = CourseDao.GetCoursesByUserName(username);
                return Ok(outputList);

            }
            catch (System.Exception)
            {
                return NotFound();
            }
        }

        [HttpGet("{id}/courses")]
        public ActionResult<List<Course>> GetCoursesByTeacherId(int id)
        {
            try
            {
                List<Course> outputList = CourseDao.GetCoursesByUserId(id);
                return Ok(outputList);

            }
            catch (System.Exception)
            {
                return NotFound();
            }
        }

        [HttpGet("course/{id}")]
        public ActionResult<Course> GetCourseByCourseId(int id)
        {
            try
            {
                Course output = CourseDao.GetCourseByCourseId(id);
                return Ok(output);

            }
            catch (System.Exception)
            {
                return NotFound();
            }
        }

        [HttpGet("course/{id}/assignments")]
        public ActionResult<List<Assignment>> GetAssignmentsByCourseId(int id)
        {
            try
            {
                List<Assignment> output = AssignmentDao.GetAssignmentsByCourseId(id);
                return Ok(output);

            }
            catch (System.Exception)
            {
                return NotFound();
            }
        }

        [HttpGet("courses/{id}/curriculum")]
        public ActionResult<List<CurriculumElement>> GetCurriculumByCourseId(int id)
        {
            try
            {
                List<CurriculumElement> output = CurriculumElementDao.GetCurriculumElementsByCourse(id);
                return Ok(output);

            }
            catch (System.Exception)
            {
                return NotFound();
            }
        }

        [HttpGet("courses/curriculum/{id}")]
        public ActionResult<CurriculumElement> GetCurriculumElementByElementId(int id)
        {
            try
            {
                CurriculumElement output = CurriculumElementDao.GetCurriculumElementByCurriculumId(id);
                return Ok(output);

            }
            catch (System.Exception)
            {
                return NotFound();
            }
        }

        [HttpGet("course/curriculum/{id}/sources")]
        public ActionResult<List<Source>> GetSourceByCourseId(int id)
        {
            try
            {
                List<Source> output = SourceDao.GetSourcesByCurriculumElement(id);
                return Ok(output);

            }
            catch (System.Exception)
            {
                return NotFound();
            }
        }


    }
}



//    [HttpGet("notifications")]
//    public ActionResult<List<Notification>> GetNotificationsByUserId(int UserId)
//    {
//        try
//        {
//            List<Notification> outputList = NotificationDao.GetNotificationsById(UserId);
//            return Ok(outputList);

//        }
//        catch (System.Exception)
//        {
//            return NotFound();
//        }
//    }

//    [HttpGet("students/{studentId}")]
//    public ActionResult<User> GetStudentByStudentId(int studentId)
//    {
//        try
//        {
//            User output = UserDao.GetStudentByStudentId(studentId);
//            return Ok(output);

//        }
//        catch (System.Exception)
//        {
//            return NotFound();
//        }
//    }
//    //Change route to curriculm element or something like that
//    [HttpGet("courses/{courseId}/assignments")]
//    public ActionResult<List<Assignment>> GetAssignmentsByCourseId(int courseId)
//    {
//        try
//        {
//            List<Assignment> outputList = AssignmentDao.GetAssignmentsByCourseId(courseId);
//            return Ok(outputList);

//        }
//        catch (System.Exception)
//        {
//            return NotFound();
//        }
//    }

//path: '/teacher/courses?action=create',

//path: '/teacher/courses?action=create',

//path: '/teacher/courses/:courseId?action=edit',

//path: '/teacher/courses/:courseId/assignment?action=create',

//path: '/teacher/courses/:courseId/assignment?action=edit',