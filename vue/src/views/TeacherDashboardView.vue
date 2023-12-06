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

.footer {
    /* position: 10%; */
    left: 200px;
    bottom: 0;
    width: 100%;
    background-color: rgb(16, 24, 40,1);
    color: white;
    text-align: left;
  }
</style>
