import { createRouter as createRouter, createWebHistory } from 'vue-router'
import { useStore } from 'vuex'

// Import components
import HomeView from '../views/HomeView.vue';
import LoginView from '../views/LoginView.vue';
import LogoutView from '../views/LogoutView.vue';
import RegisterView from '../views/RegisterView.vue';
import TeacherDashboardView from '../views/TeacherDashboardView.vue';
import CreateCourseView from '../views/CreateCourseView.vue';
import TeacherCoursesView from '../views/TeacherCoursesView.vue';
import StudentDashboardView from '../views/StudentDashboardView.vue';

/**
 * The Vue Router is used to "direct" the browser to render a specific view component
 * inside of App.vue depending on the URL.
 *
 * It also is used to detect whether or not a route requires the user to have first authenticated.
 * If the user has not yet authenticated (and needs to) they are redirected to /login
 * If they have (or don't need to) they're allowed to go about their way.
 */
const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView,
    //META TAG adds an authorization requirement
    // This was originally true but should allow access to main
    meta: {
      requiresAuth: false
    }
  },
  {
    path: "/login",
    name: "login",
    component: LoginView,
    meta: {
      requiresAuth: false
    }
  },
  {
    path: "/logout",
    name: "logout",
    component: LogoutView,
    meta: {
      requiresAuth: false
    }
  },
  {
    path: "/register",
    name: "register",
    component: RegisterView,
    meta: {
      requiresAuth: false
    }
  },
  {
    path: "/teacher",
    name: "TeacherDashboardView",
    component: TeacherDashboardView,
    // meta: {
    //   requiresAuth: true
    // }
  },
  {
    path: '/teacher/courses',
    component: TeacherCoursesView,
    name: 'TeacherCoursesView',
    meta: {
      requiresAuth: true
    }
  },
  // {
  //   path: '/teacher/courses/:courseId',
  //   component: TeacherCoursesView,
  //   name: 'TeacherCoursesView',
  //   meta: {
  // 	requiresAuth: true
  // 	}
  // },
  // {
  //   path:'/teacher/courses?action=create',
  //   component: AddCourseView,
  //   name: 'AddCourseForm',
  //   meta: {
  // 	requiresAuth: true
  // 	}
  // },
  // {
  //   path: '/teacher/courses/:courseId?action=edit',
  //   component: EditCourseView,
  //   name: 'EditCourseView',
  //   meta: {
  // 	requiresAuth: true
  // 	}
  // },


  // {
  //   path: '/teacher/courses/:courseId/curriculum-elements',
  //   component: CourseView,
  //   name: 'CourseView',
  //   meta: {
  // 	requiresAuth: true
  // 	}
  // },
  // {
  //   path: '/teacher/courses/:courseId/curriculum-elements/:curriculum-element-id/assignments',
  //   component: ElementView,
  //   name: 'ElementView',
  //   meta: {
  // 	requiresAuth: true
  // 	}
  // },
  // {
  //   path: '/teacher/courses/:courseId/curriculum-elements/:curriculum-element-id/assignments/:assignmentId',
  //   component: AssignmentView,
  //   name: 'AssignmentView',
  //   meta: {
  // 	requiresAuth: true
  // 	}
  // },
  // {
  //   path: '/teacher/courses/:courseId/curriculum-elements/:curriculum-element-id/assignment?action=create',
  //   component: AddAssignmentView,
  //   name: 'AddAssignmentView',
  //   meta: {
  // 	requiresAuth: true
  // 	}
  // },


  // {
  //   path: '/teacher/courses/:courseId/assignment',
  //   component: AssignmentView,
  //   name: 'AssignmentView',
  //   meta: {
  // 	requiresAuth: true
  // 	}
  // },



  // {
  //   path: '/teacher/courses/:courseId/assignment?action=edit',
  //   component: EditAssigmentView,
  //   name: 'EditAssignmentView',
  //   meta: {
  // 	requiresAuth: true
  // 	}
  // },

  // {
  //   path: '/teacher/submitted-assignments',
  //   component: SubmittedAssignmentsView,
  //   name: 'SubmittedAssignmentsView',
  //   meta: {
  // 	requiresAuth: true
  // 	}
  // },
  // {
  //   path: '/teacher/submitted-assignment/:studentId',
  //   component: SubmittedAssignmentView,
  //   name: 'SubmittedAssignmentView',
  //   meta: {
  // 	requiresAuth: true
  // 	}
  // },

  // {
  //   path:'/teacher/students',
  //   component: TeacherStudentView,
  //   name: 'TeacherStudentView',
  //   meta: {
  // 	requiresAuth: true
  // 	}
  // },
  // {
  //   path:'/teacher/students/:id',
  //   component: TeacherStudentView,
  //   name: 'TeacherStudentView',
  //   meta: {
  // 	requiresAuth: true
  // 	}
  // },

  // {
  //   path:'/teacher/notifications',
  //   component: TeacherNotificationView,
  //   name: 'TeacherNotificationView',
  //   meta: {
  // 	requiresAuth: true
  // 	}
  // },



   {
     path:'/student',
     component: StudentDashboardView,
     name: 'StudentDashboardView',
  //   meta: {
  // 	requiresAuth: true
  // 	}
   },
  // {
  //   path:'/student/courses',
  //   component: StudentCourseView,
  //   name: 'StudentView',
  //   meta: {
  // 	requiresAuth: true
  // 	}
  // },
  // {
  //   path:'/student/course/:CourseId',
  //   component: StudentCourseView,
  //   name: 'StudentCourseView',
  //   meta: {
  // 	requiresAuth: true
  // 	}
  // },

  // {
  //   path: '/student/courses/:courseId/curriculum-elements',
  //   component: CourseView,
  //   name: 'CourseView',
  //   meta: {
  // 	requiresAuth: true
  // 	}
  // },
  // {
  //   path: '/student/courses/:courseId/curriculum-elements/:curriculum-element-id/assignments',
  //   component: ElementView,
  //   name: 'ElementView',
  //   meta: {
  // 	requiresAuth: true
  // 	}
  // },
  // {
  //   path: '/student/courses/:courseId/curriculum-elements/:curriculum-element-id/assignments/:assignmentId',
  //   component: AssignmentView,
  //   name: 'AssignmentView',
  //   meta: {
  // 	requiresAuth: true
  // 	}
  // },

  // {
  //   path: '/student/submitted-assignment',
  //   component: SubmittedAssignmentView,
  //   name: 'SubmittedAssignmentView',
  //   meta: {
  // 	requiresAuth: true
  // 	}
  // },

  // {
  //   path: '/student/submitted-assignment',
  //   component: SubmittedAssignmentView,
  //   name: 'SubmittedAssignmentView',
  //   meta: {
  // 	requiresAuth: true
  // 	}
  // },

  // {
  //   path: '/student/submitted-assignment?action=create',
  //   component: SubmittedAssignmentView,
  //   name: 'SubmittedAssignmentView',
  //   meta: {
  // 	requiresAuth: true
  // 	}
  // },

  // {
  //   path:'/student/course/:CourseId/assignment/:AssignmentId',
  //   component: StudentAssignmentView,
  //   name: 'StudentAssignmentView',
  //   meta: {
  // 	requiresAuth: true
  // 	}
  // },
  // {
  //   path:'/student/course/:CourseId/assigment/:AssignmentId?Action=edit',
  //   component: StudentView,
  //   name: 'StudentView',
  //   meta: {
  // 	requiresAuth: true
  // 	}
  // },
];

// Create the router
const router = createRouter({
  history: createWebHistory(),
  routes: routes
});

router.beforeEach((to) => {

  // Get the Vuex store
  const store = useStore();

  // Determine if the route requires Authentication
  const requiresAuth = to.matched.some(x => x.meta.requiresAuth);

  // If it does and they are not logged in, send the user to "/login"
  if (requiresAuth && store.state.token === '') {
    return { name: "login" };
  }
  // Otherwise, do nothing and they'll go to their next destination
});

export default router;
