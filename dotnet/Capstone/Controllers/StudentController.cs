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
using Capstone.Models.DTO_s;

namespace Capstone.Controllers
{
    [Route("student")]
    [ApiController]
   //[Authorize]
    public class StudentController : ControllerBase
    {
        private readonly IAssignmentDao assignmentDao;
        private readonly ICourseDao courseDao;
        private readonly IUserDao userDao;
        private readonly ICurriculumElementDao curriculumElementDao;
        private readonly IQuestionDao questionDao;
        private readonly ISubmittedAssignmentDao submittedAssignmentDao;
        private readonly IAnswerDao answerDao;

        
        public StudentController(ICourseDao courseDao, IUserDao userDao, ICurriculumElementDao curriculumElementDao, IAssignmentDao assignmentDao, IQuestionDao questionDao, ISubmittedAssignmentDao submittedAssignmentDao, IAnswerDao answerDao)
        {
            //this.dashboardDao = dashboardDao;
            this.courseDao = courseDao;
            this.userDao = userDao;
            this.curriculumElementDao = curriculumElementDao;
            this.assignmentDao = assignmentDao;
            this.questionDao = questionDao;
            this.submittedAssignmentDao = submittedAssignmentDao;
            this.answerDao = answerDao;
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

        public ActionResult<List<GrabAssignmentDTO>> GetAssignments(int id)
        {
            try
            {
                List<Assignment> assList = assignmentDao.GetAssignmentsByCurriculumElementId(id);
                List<GrabAssignmentDTO> outputList = new List<GrabAssignmentDTO>();
                foreach (Assignment item in assList)
                {
                    GrabAssignmentDTO temp = new GrabAssignmentDTO(item);
                    temp.Questions = questionDao.GetQuestionsByAssignmentId(item.AssignmentId);
                    outputList.Add(temp);
                }
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
        [HttpPost("{userId}/courses/{courseId}/curriculum/{curriculumId}")]
        public ActionResult<SubmittedAssignment> AddSubmittedAssignment(GrabAssignmentDTO incomingAssignmentQuestions, int userId, int curriculumId, int courseId)
        {
            try
            {
                SubmittedAssignment output = new SubmittedAssignment();
                Course course = new Course();
                // grab the teacherId from the courseDAO\
                course = courseDao.GetCourseByCourseId(courseId);
                output.TeacherId = course.TeacherId;
                // build a new SubmittedAssignment Object
                output.StudentId = userId;
                output.CourseId = courseId;
                output.AssignmentId = incomingAssignmentQuestions.CurriculumElementId;
                // fill in the data and pass to submittedAssignmentDAO
                // get back the new submittedAssignment, 
                SubmittedAssignment submit = submittedAssignmentDao.AddSubmittedAssignment(output);
                // loop through incomingAssignmentQuestions.Questions
                //TODO: fix loop
                foreach (Question item in incomingAssignmentQuestions.Questions)
                {
                    Answer answer = new Answer();
                    answer.SubmittedAssignmentId = submit.SubmittedAssignmentId;
                    answer.AnswerText = item.StudentAnswer;
                    answer.QuestionId = item.QuestionId;
                    answer.QuestionType = item.QuestionType;
                    answerDao.AddSubmittedAnswer(answer);
                }
                return Ok(output);
                // for each question, build a new Answers object
                // fill in the data for the answers object
                // call the answersDAO and pass it the answer object
                // ends your for loop

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