using Microsoft.AspNetCore.Mvc;
using Capstone.Exceptions;
using Capstone.Models;
using Capstone.Security;
using Microsoft.AspNetCore.Authorization;
using System.Collections.Generic;
using Capstone.DAO.SqlDaoInterfaces;

namespace Capstone.Controllers
{
    [Route("teacher")]
    [ApiController]
    //[Authorize]
    public class TeacherController : ControllerBase
    {
        private readonly IUserDao UserDao;
        //private readonly IAssignmentDao AssignmentDao;
        //private readonly ICourseDao CourseDao;
        //private readonly INotificationDao NotificationDao;
        public TeacherController(IUserDao userDao)
        {
            //this.dashboardDao = dashboardDao;
            this.UserDao = userDao;
            //this.AssignmentDao = assignmentDao;
            //this.CourseDao = courseDao;
            //this.NotificationDao = notificationDao;

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
    }
}

        //[HttpGet("courses")]
        //    public ActionResult<List<Course>> GetCoursesByUsername()
        //    {
        //        try
        //        {
        //            List<Course> outputList = CourseDao.GetCoursesByUserName(User.Identity.Name);
        //            return Ok(outputList);

        //        }
        //        catch (System.Exception)
        //        {
        //            return NotFound();
        //        }
        //    }
        //    [HttpGet("courses/{courseId}")]
        //    public ActionResult<Course> GetCourseByCourseId(int courseId)
        //    {
        //        try
        //        {
        //            Course output = CourseDao.GetCourseByCourseId(courseId);
        //            return Ok(output);

        //        }
        //        catch (System.Exception)
        //        {
        //            return NotFound();
        //        }
        //    }
        //    [HttpGet("students")]
        //    public ActionResult<List<User>> GetUsersByTeacherId(int teacherId)
        //    {
        //        try
        //        {
        //            List<User> Listoutput = userDao.GetUsersByTeacherId(teacherId);
        //            return Ok(Listoutput);

        //        }
        //        catch (System.Exception)
        //        {
        //            return NotFound();
        //        }
        //    }

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