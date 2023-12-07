<template>
  <div class="sidebar">
    <side-bar-teacher-dashboard></side-bar-teacher-dashboard>
  </div>
  <!-- <div class="grid-container">
      <h1>Welcome to Your Teacher Dashboard!</h1>
      <P>LearnWell streamlines course organization and assignment management for teachers, while providing students with
        easy access to homework, submission, and teacher communication.</P>
      <div class="buttons">
        <a class="button is-link is-outlined"><router-link v-bind:to="{name: 'TeacherDashboardView'}"><strong>Get Started</strong></router-link></a>
      </div>
    </div>  -->
  <h1>{{ user.firstName }}</h1>
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

export default {
  components: {
    SideBarTeacherDashboard,
  },
  data() {
    return {
      user: {},
    };
  },
  created() {
    // console.log()
    TeacherService.getTeacherData(this.$store.state.user.userId)
      .then((response) => {
        console.log(response.data)
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
</style>
