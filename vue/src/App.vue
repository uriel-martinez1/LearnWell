<template>

  <div class="sidebar" v-if="$store.state.token != ''">
    <div v-if="!$store.state.user.role == false">
      <side-bar-student-dashboard v-if="$store.state.user.role == 'student'"></side-bar-student-dashboard>
      <side-bar-teacher-dashboard v-else></side-bar-teacher-dashboard>
    </div>
  </div>
  <div id="capstone-app">
    <router-view :key="$route.fullPath"/>
  </div>
</template>
<script>
import SideBarStudentDashboard from "./components/Student/SideBarStudentDashboard.vue";
import SideBarTeacherDashboard from "./components/Teacher/SideBarTeacherDashboard.vue";
export default {
  components: {
    SideBarStudentDashboard,
    SideBarTeacherDashboard,
  },
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

#capstone-app {
  box-sizing: border-box;
  transform: translate(15vw);
  margin-bottom: 60px;
}

.logoutButton {
  position: fixed;
  z-index: 2;
  bottom: 0;
  background-color: rgb(179, 184, 179);
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

div #capstone-app {
   display: flex;
  justify-content: left;
  flex-direction: column;
  width: 80%; 
  margin-left: 2%; 
  padding-right: 10px; 
  text-align: left; 
}
</style>
