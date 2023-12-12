<template>
  <div class="sidebar">
    <div class="header">
      <a class="navbar-item">
        <img class="icon" src="../../icon/icons8-books-64.png" />
        <p><strong>LEARNWELL</strong></p>
      </a>
      <h2><strong>Student Dashboard</strong></h2>
    </div>
    <nav>
      <router-link class="button"
        :to="{ name: 'StudentDashboardView', params: { id: $store.state.user.userId } }">Dashboard</router-link>
      <button class="button" v-on:click="showCourses">Courses</button>
      <div v-show="displayCourses">
        <router-link :to="{name: 'StudentCourseSummaryView', params: {courseId: course.courseId }}" class="button is-link" id="courseButton" 
         v-for="course in $store.state.sideBarData"
          v-bind:key="course.courseId">
          {{ course.courseName }}
        </router-link>
      </div>
      <button v-on:click="() => (showAssignments = !showAssignments)" type="button" class="button">
        Assignments
      </button>
      <div v-if="showAssignments">
        <button id="assignmentButton" v-for="assignment in this.$store.state.user.courses[0]
          .curriculumElements[0].assignments" v-bind:key="assignment.assignmentId">
          {{ assignment.title }}
        </button>
      </div>
      <button type="button" class="button">Notifications</button>
      <router-link class="logoutButton" type="button" v-bind:to="{ name: 'logout' }"
        v-if="$store.state.token != ''">Logout</router-link>
    </nav>
  </div>
</template>

<script>
// import StudentService from "../services/StudentService"
// import StudentCourseList from "../components/StudentCourseList.vue"
export default {
   components: {
  // StudentCourseList,
  },
  data() {
    return {
      displayCourses: false,
      courses: []
      // showAssignments: false,
    };
  },
  computed:{

  },
  methods: {
    routeCourseSummary(courseId){
      this.$router.push({name: 'CourseSummaryView', params: {'courseId' : courseId}})
    },
    showCourses(){
      this.displayCourses = !this.displayCourses
      console.log(this.courses)
    }
  },
  created(){

  }
};
</script>

<style scoped>
nav {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}

.sidebar .button {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  background-color: #04aa6d;
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  width: 200px;
  text-decoration: none;
  font-size: 16px;
  margin: 4px 2px;
  border-radius: 8px;
  cursor: pointer;
}

/* .sidebar button:hover {
  background-color: lightcyan;
  color: blueviolet;
} */

/* #assignmentButton {
  background-color: rgb(128, 31, 128);
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  width: 200px;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  border-radius: 8px;
  cursor: pointer;
} */

.sidebar {
  height: 100%;
  width: 15vw;
  position: fixed;
  z-index: 1;
  top: 10;
  left: 0;
  background-color: lightcyan;
  overflow-x: hidden;
}

/* .header {
  color: black;
  text-align: left;
  padding-left: 15px;
  padding-bottom: 10px;
  font-size: 25px;
  top: 0;
} */

/* .navbar-item {
  text-align: left;
  padding-left: 10px;
  padding-bottom: 10px;
  font-size: 15px;
} */

.icon {
  height: auto;
}
</style>
