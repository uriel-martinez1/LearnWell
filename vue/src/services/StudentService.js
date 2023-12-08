import axios from 'axios';

export default {

  getStudentData(userId) {
    return axios.get(`/student/${userId}`);
  },

  getCoursesByStudentId(userId) {
    return axios.get(`/student/${userId}/courses/`)
  },

  getCurriculumByCourseId(courseId) {
    return axios.get(`/student/courses/curriculum/${courseId}`)
  },
  getAssignmentsByCurriculumId(id){
    return axios.get(`/student/${id}/assignments`)
  },

  // addCourse(course) {
  //   return axios.post(`/course`, course);
  // },

  updateAssignment(userId, courseId, assignment) {
    return axios.put(`/student/${userId}/courses/${courseId}/${assignment.id}?action=edit`, assignment);
  },

  deleteCourse(courseId) {
    return axios.delete(`/cards/${courseId}`);
  },
  addBoard(board){
    return axios.post('/boards',board);
  },
  deleteBoard(boardID)
  {
    return axios.delete(`/boards/${boardID}`);
  }

}