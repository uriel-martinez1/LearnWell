import axios from 'axios';

export default {

  getCourses() {
    return axios.get('/courses');
  },

  getTeacherData(id){
    return axios.get(`/teacher/${id}`)
  }

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