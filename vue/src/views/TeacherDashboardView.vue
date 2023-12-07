<template>
    <div class="sidebar">
      <side-bar-teacher-dashboard></side-bar-teacher-dashboard>
    </div>
       <div class="grid-container">
          <h2>Welcome back, Sarah!</h2>
          <h1><strong>Overview</strong></h1>
            <P>LearnWell streamlines course organization and assignment management for teachers, while providing students with
                easy access to homework, submission, and teacher communication.
            </P>
          <div class="buttons">
            <a class="button is-link is-outlined"><router-link v-bind:to="{name: 'TeacherDashboardView'}"><strong>Get Started</strong></router-link></a>
          </div>
        </div> 
        <div class="todayDate">Tuesday November 30, 2023</div> 
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
.grid-container {
  display: flex;
  justify-content: left;
  flex-direction: column;
  width: 40%;
  margin-left: 20%;
  text-align: left;
}
.grid-container h2 {
  margin-top: 30px;
  margin-bottom: 50px;
}
.todayDate {
  display: flex;
  justify-content: right;
  align-items: center;
  
}
.footer {
    position: fixed;
    margin-left: 13%;
    bottom: 0;
    height: 5%;
    width: 100%;
    background-color: #04AA6D;
    color: white;
    text-align: left;
  }
</style>
