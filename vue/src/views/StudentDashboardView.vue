<template>
    <!-- <div class="sidebar">
      <side-bar-student-dashboard></side-bar-student-dashboard>
    </div> -->
       <div class="flex-container">
        <section  class="todayDate">
          <h2>Welcome back, {{ user.firstName }} {{ user.lastName }}!</h2> <div>Tuesday November 30, 2023</div> 
        </section>
          <h1><strong>Overview</strong></h1>
            <p>LearnWell streamlines course organization and assignment management for teachers, while providing students with
                easy access to homework, submission, and teacher communication.
            </p>
            <student-course-list></student-course-list>
        </div> 
        
</template>
  
<script>
  // import SideBarStudentDashboard from '../components/Student/SideBarStudentDashboard.vue'
  
  import StudentService from "../services/StudentService"
  import StudentCourseList from "../components/StudentCourseList.vue"
  
  export default {
    components: {
      // SideBarStudentDashboard,
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
          this.user = response.data;
        });
    console.log(this.$store.state.user.role)
    },
  };
</script>

<style>
.flex-container {
  display: flex;
  justify-content: left;
  flex-direction: column;
  width: 40%;
  margin-left: 20%;
  text-align: left;
}
.todayDate {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 50px;
  padding-top: 30px;
}
/* .footer {
    position: fixed;
    margin-left: 13%;
    bottom: 0;
    height: 5%;
    width: 100%;
    background-color: #04AA6D;
    color: white;
    text-align: left;
  } */
</style>