<template>
  <!-- <div class="sidebar">
    <side-bar-teacher-dashboard></side-bar-teacher-dashboard>
  </div> -->
  <div class="main-content">
    <div class="box">
      <h1>Teacher: {{ user.firstName }} {{ user.lastName }}</h1>
      
    </div>
    <div class="box">
      <label for="courses">Courses</label>
      <input id="courses" name="courseOrStudent" type="radio" v-bind:value=true v-model="courseOrStudent">
      <label for="students">Students</label>
      <input id="students" name="courseOrStudent" type="radio" v-bind:value="false" v-model="courseOrStudent">
    </div>
    <teacher-courses-list v-if="this.courseOrStudent"></teacher-courses-list>
    <student-list v-else></student-list>
    <!-- <div class="grid-container">
      <h1>Welcome to Your Teacher Dashboard!</h1>
      <P>LearnWell streamlines course organization and assignment management for teachers, while providing students with
        easy access to homework, submission, and teacher communication.</P>
      <div class="buttons">
        <a class="button is-link is-outlined"><router-link v-bind:to="{name: 'TeacherDashboardView'}"><strong>Get Started</strong></router-link></a>
      </div>
    </div>  -->
  </div>
  <div class="footer">
    <footer>
      <p>Copyright ©-All rights are reserved</p>
    </footer>
  </div>
</template>

<script>
import SideBarTeacherDashboard from "../components/Teacher/SideBarTeacherDashboard.vue";
import pageFooter from "../components/Footer.vue";
import TeacherService from "../services/TeacherService";
import StudentList from "../components/TeacherStudentList.vue";
import TeacherCoursesList from "../components/TeacherCoursesList.vue";

export default {
  components: {
    // SideBarTeacherDashboard,
    StudentList,
    TeacherCoursesList,
  },
  data() {
    return {
      courseOrStudent: true,
      user: {},
    };
  },
  created() {
    TeacherService.getTeacherData(this.$store.state.user.userId)
      .then((response) => {
        this.user = response.data;
      });
  },
};
</script>
<style>
.footer {
  position: absolute;
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
