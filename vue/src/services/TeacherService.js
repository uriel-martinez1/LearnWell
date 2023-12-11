import axios from 'axios';

export default {

  getCourses() {
    return axios.get('/courses');
  },

  getTeacherData(id){
    return axios.get(`/teacher/${id}`)
  },

  getStudentDataByTeacher(id){
    return axios.get(`/teacher/${id}/students`)
  },

  getStudentCoursesByStudentUsername(username){
    return axios.get(`/teacher/students/${username}/courses`)
  },

  getCoursesByTeacherId(id) {
    return axios.get(`/teacher/${id}/courses`)
  },

  //unsure about the placement of it being here or create a new service folder for course
  // Also unsure about the structure of the path
  addCourseByTeacherId(id, course) {
    return axios.post(`/teacher/${id}/courses`, course)
  },

  // Also used in create course form
  updateCourseFormByTeacherId(id, course) {
    return axios.put(`/teacher/${id}/courses/${course.id}`, course);
  },
  // Added this one also -- get single course by id
  getCourseByTeacherId(id, course) {
    return axios.get(`/teacher/${id}/courses/${course.id}`, course);
  },

  getCurriculumByCourseId(id){
    return axios.get(`/teacher/courses/${id}/curriculum`)
  },

  getCurriculumElementById(id){
    return axios.get(`/teacher/courses/curriculum/${id}`)
  },

  // getCourse(courseId) {
  //   return axios.get(`/courses/${courseId}`)
  // },

  // getCard(cardId) {
  //   return axios.get(`/cards/${cardId}`)
  // },

  // addCard(card) {
  //   return axios.post('/cards', card);
  // },

  // updateCard(card) {
  //   return axios.put('/cards/' + card.id, card);
  // },

  // deleteCard(cardId) {
  //   return axios.delete(`/cards/${cardId}`);
  // },
  // addBoard(board){
  //   return axios.post('/boards',board);
  // },
  // deleteBoard(boardID)
  // {
  //   return axios.delete(`/boards/${boardID}`);
  // }

}