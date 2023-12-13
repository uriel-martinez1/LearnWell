<template>
  <!-- <div>
  v-if="shouldShowSidebar" 

  </div> -->
  <div class="sidebar" v-if="$store.state.token != ''">
    <div v-if="!$store.state.user.role == false">
      <!-- STUDENT SIDEBAR DASHBOARD NOT WORKING, DOES NOT RENDER AT ALL, NEED HELP FROM THE HIGHER POWERS WITH OR WITHOUT PONYTAIL -->
      <side-bar-student-dashboard v-if="$store.state.user.role == 'student'"></side-bar-student-dashboard>
      <side-bar-teacher-dashboard v-else></side-bar-teacher-dashboard>
    </div>
  </div>
  <div id="capstone-app">
    <!--We need to keep this so we can render components every time a path changes and we need to render a component-->
    <router-view :key="$route.fullPath"/>
  </div>
  <div class="footer">
    <footer>
      <p>
        Copyright LearnWell ©-All rights are reserved
      </p>
    </footer>
  </div>
</template>
<!-- create component using above to go on other views; use this id- "nav" -->
<script>
import SideBarStudentDashboard from "./components/Student/SideBarStudentDashboard.vue";
import SideBarTeacherDashboard from "./components/Teacher/SideBarTeacherDashboard.vue";
export default {
  components: {
    SideBarStudentDashboard,
    SideBarTeacherDashboard,
  },
  // created for error handling
  computed: {
    notification() {
      return this.$store.state.notification;
    },
    notificationClass() {
      return {
        'status-message': true,
        error: this.notification?.type?.toLowerCase() === 'error',
        success: this.notification?.type?.toLowerCase() === 'success'
      };
    }
  },
  methods: {
    clearNotification() {
      this.$store.commit('CLEAR_NOTIFICATION');
    },
  }

};
</script>
<style>
/* #capstone-app {
  box-sizing: border-box;
  height: 100vh;
  width: 100vw;
  transform: translate(15vw);

} */

/* THIS IS A QUICK FIX  */
/* #capstone-app{
  transform: translate(15vw);
  
}   */

.logoutButton {
  position: fixed;
  z-index: 2;
  bottom: 0;
  background-color: rgb(184, 179, 179);
  border: none;
  color: black;
  padding: 5px 5px;
  text-align: center;
  width: 100px;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  border-radius: 8px;
  cursor: pointer;
}

.footer {
  position: fixed;
  padding-left: 17%;
  padding-top: 0;
  padding-bottom: 0;
  left: 0;
  bottom: 0;

  width: 100%;
  background-color: #04aa6d;
  color: white;
  text-align-last: left;
}

/* div #capstone-app {
   display: flex;
  justify-content: left;
  flex-direction: column;
  width: 80%; 
  margin-left: 2%; 
  padding-right: 10px; 
  text-align: left; 
} */
</style>
