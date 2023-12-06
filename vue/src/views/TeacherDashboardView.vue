<template>
    <div class="sidebar">
      <side-bar-teacher-dashboard></side-bar-teacher-dashboard>
    </div>
    <div class="grid-container">
      <h1>Lets make learning easier for all</h1>
      <P>LearnWell streamlines course organization and assignment management for teachers, while providing students with
        easy access to homework, submission, and teacher communication.</P>
      <div class="buttons">
        <a class="button is-link is-outlined"><router-link v-bind:to="{name: 'TeacherDashboardView'}"><strong>Get Started</strong></router-link></a>
      </div>
    </div>
        <div>
      <footer>
        <p>
        Copyright ©-All rights are reserved
      </p>
      </footer>
        </div>
  </template>
  
  <script>
  import SideBarTeacherDashboard from '../components/Teacher/SideBarTeacherDashboard.vue'
  //import pageFooter from '../components/Footer.vue'
  
  export default {
    components: {
      SideBarTeacherDashboard,
      //pageFooter
    }
  };
  </script>