import { createStore as _createStore } from 'vuex';
import axios from 'axios';
// created this for the mutations 
const NOTIFICATION_TIMEOUT = 6000;

export function createStore(currentToken, currentUser) {
  let store = _createStore({
    state: {
      token: currentToken || '',
      user: currentUser || {},
      // created for error handling
      notification: null,
      users:
      {
        userid: 1,
        firstName: 'bobby',
        lastName: 'smith',
        email: 'bob.smith@email.com',
        userName: 'bobbys',
        passwordHash: 'jdhfiueuiofhwr',
        salt: 'jfiwer_kv_+mdkvj_vmdkmdk',
        isTeacher: true,
        isAdmin: false,
        userRole: 'teacher',
        isActive: true,
        createdDate: '2022-01-01',
        lastUpdated: null,
        courses: [
          {
            courseId: 1,
            teacherId: 1,
            courseName: "biology",
            description: "Learn about biology.",
            difficulty: 1,
            cost: 0,
            createdDate: '2023-11-11',
            lastUpdated: '2023-12-11',
            isActive: true,
            students: [
              {
                userid: 2,
                firstName: 'johnny',
                lastName: 'walker',
                email: 'jonny.walker@email.com',
                userName: 'jonnyw',
                passwordHash: 'jdhfiueuiofhwr',
                salt: 'jfiwer_kv_+mdkvj_vmdkmdk',
                isTeacher: false,
                isAdmin: false,
                userRole: 'student',
                isActive: true,
                createdDate: '2022-01-01',
                lastUpdated: null,
              },

            ],
            curriculumElements: [
              {
                courseId: 1,
                curriculumElementId: 1,
                courseOrder: 1,
                title: 'Intro To HTML',
                description: 'Learn the basics to html',
                lectureContent: 'Lorem ipsum dolor sit amet. Ex facere voluptas eos reprehenderit ratione et quas iure? Aut molestiae nisi est molestiae dolorem non asperiores quia 33 asperiores quia et voluptatem delectus. Et minus ipsam et nulla laudantium hic molestias galisum non obcaecati veniam sit voluptatum rerum id doloremque laboreEt quisquam neque rem illo modi et tenetur soluta id nihil obcaecati sed porro pariatur. Qui minus soluta quo necessitatibus facere aut quia consectetur sed corrupti pariatur aut nesciunt tempore qui quia alias a sunt voluptas. Ab nostrum dolor eum sapiente velit sit vitae aliquam vel rerum itaque et accusantium dolores et maiores rerum. Qui nihil modi in veritatis animi ea voluptatum magnam qui temporibus exercitationem id obcaecati consequuntur qui excepturi eveniet aut magnam repudiandae.',
                createdDate: '2022-08-10',
                lastUpdated: '2022-09-25',
                isActive: true,
                sources: [
                  {
                    sourceId: 1,
                    curriculumElementId: 1,
                    sourceUrl: 'example.com/html-basics',
                    createdDate: '2022-08-10',
                    lastUpdated: null,
                    isActive: true,
                  }
                ],
                assignments: [
                  {
                    assignmentId: 1,
                    curriculumElementId: 1,
                    title: 'Quiz',
                    description: 'Please read how to create basics web pages using html elements.',
                    type: 'HomeWork',
                    createdDate: '2022-08-10',
                    lastUpdated: null,
                    isActive: true,
                    questions: [
                      {
                        questionsId: 1,
                        prompt: 'What does HTML stand for?',
                        type: 'Text',
                        answer1: null,
                        answer2: null,
                        answer3: null,
                        answer4: null,
                        correctChoiceAnswer: null,
                      }
                    ],

                  },
                ],
              }
            ]
          },
        ],
      },
      submittedAssignments: [
        {
          submittedAssignmentId: 1,
          assignmentId: 1,
          studentId: 2,
          teacherId: 1,
          courseId: 1,
          score: 0,
          submissionTime: '2022-09-25',
          gradedDate: null,
          lastEdited: null,
          lastUpdated: null,
          numberOfEdits: 0,
          comments: [
            {
              commentId: 1,
              submittedAssignmentId: 1,
              createdBy: 2,
              comment: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
              createdAt: '2022-09-26',
              lastEdited: null,
              numberOfEdits: 0,
            }
          ],
          answers: [
            {
              answersId: 1,
              submittedAssignmentId: 1,
              type: 'Text',
              answerChoice: null,
              answerText: null,
              answerExternal: null,
              isCorrect: false,
            }
          ]
        }
      ]
    },
    mutations: {
      SET_AUTH_TOKEN(state, token) {
        state.token = token;
        localStorage.setItem('token', token);
        axios.defaults.headers.common['Authorization'] = `Bearer ${token}`;
      },
      SET_USER(state, user) {
        state.user = user;
        localStorage.setItem('user', JSON.stringify(user));

      },
      LOGOUT(state) {
        localStorage.removeItem('token');
        localStorage.removeItem('user');
        state.token = '';
        state.user = {};
        axios.defaults.headers.common = {};
      },
      // Added for error handling 
      SET_NOTIFICATION(state, notification) {
        if(state.notification) {
          this.commit('CLEAR_NOTIFICATION');
        }
        if(typeof notification === 'string'){
          notification = {
            message: notification,
            type: 'error',
            timeout: NOTIFICATION_TIMEOUT
          }
        }
        else {
          notification.type = notification.type || 'error';
          notification.timeout = notification.timeout || NOTIFICATION_TIMEOUT;
        }

        state.notification = notification;

        notification.timer = window.setTimeout(() =>{
          this.commit('CLEAR_NOTIFICATION');
        }, notification.timeout);
      },

      CLEAR_NOTIFICATION(state) {
        if(state.notification && state.notification.timer) {
          window.clearTimeout(state.notification.timer);
        }
        state.notification = null;
      }
    },
  })
  return store;
}
