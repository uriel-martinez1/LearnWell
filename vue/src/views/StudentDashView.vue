<template>
    <!-- <div class="sidebar">
      <side-bar-student-dashboard></side-bar-teacher-dashboard> // TODO is this made yet for student sidebar
    </div> -->
    <div class="main-content">
      <div class="box">
          <h1>Welcome to LearnWell!</h1>
        <h2>Student: {{ user.firstName }} {{ user.lastName }}</h2>
      </div>
      <student-course-list></student-course-list>
    </div>
    <!-- <div class="footer">
      <footer>
        <p>Copyright ©-All rights are reserved</p>
      </footer>
    </div> -->
  </template>
  
  <script>
  import pageFooter from "../components/Footer.vue";
  import StudentService from "../services/StudentService"
  import StudentCourseList from "../components/StudentCourseList.vue"
  
  export default {
    components: {
      // SideBarStudentDashboard, TODO?
      StudentCourseList,

    },
    data() {
      return {
        user: {},
        courses: {}
      };
    },
    created() {
      StudentService.getStudentData(this.$store.state.user.userId)
        .then((response) => {
          console.log('IN RESPONSE STUDENT DASH')
          this.user = response.data;
        });
    },
  };
  </script>
  <style>
  .footer {
    /* position: 10%; */
    left: 200px;
    bottom: 0;
    width: 100%;
    background-color: rgb(16, 24, 40, 1);
    color: white;
    text-align: left;
  }
  
  .main-content{
    transform: translate(200px);
    display: flex;
  }
  </style>
  