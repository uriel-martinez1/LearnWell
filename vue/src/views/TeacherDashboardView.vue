<template>
  <div class="sidebar">
    <side-bar-teacher-dashboard></side-bar-teacher-dashboard>
  </div>
  <div class="flex-container">
    <section class="todayDate">
      <h2>Welcome back, Sarah!</h2>
      <div>Tuesday November 30, 2023</div>
    </section>
    <h1><strong>Overview</strong></h1>
    <P>LearnWell streamlines course organization and assignment management for teachers, while providing students with
      easy access to homework, submission, and teacher communication.
    </P>
    <div class="buttons">
      <a class="button is-link is-outlined"><router-link v-bind:to="{ name: 'TeacherDashboardView' }"><strong>Get
            Started</strong></router-link></a>
    </div>
  </div>
  <div class="footer">
    <footer>
      <p>
        Copyright ©-All rights are reserved
      </p>
    </footer>
  </div>
</template>
  
<script>
import SideBarTeacherDashboard from '../components/Teacher/SideBarTeacherDashboard.vue'
import pageFooter from '../components/Footer.vue'

export default {
  components: {
    SideBarTeacherDashboard,

  }
};
</script>

<style>
div .flex-container {
  display: flex;
  justify-content: left;
  flex-direction: column;
  width: 80%;
  margin-left: 20%;
  padding-right: 10px;
  text-align: left;
}

.todayDate {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 50px;
  padding-top: 30px;
}

div .footer {
  position: fixed;
  padding-left: 5%;
  padding-top: 0;
  left: 0;
  bottom: 0;
  width: 100%;
  background-color: #04AA6D;
  color: white;
  text-align: left;
}</style>
