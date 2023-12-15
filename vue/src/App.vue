<template>
  <div class="sidebar" v-if="$store.state.token != ''">
    <div v-if="!$store.state.user.role == false">
      <side-bar-student-dashboard
        v-if="$store.state.user.role == 'student'"
      ></side-bar-student-dashboard>
      <side-bar-teacher-dashboard v-else></side-bar-teacher-dashboard>
    </div>
  </div>
  <div
    id="capstone-app"
    :class="{
      mainPage:
        this.$route.path.includes('/teacher') ||
        this.$route.path.includes('/student'),
      homePage: this.$route.path === '/',
      loginPage: this.$route.path === '/login',
      registerPage: this.$route.path === '/register',
    }"
  >
    <router-view :key="$route.fullPath" />
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
        "status-message": true,
        error: this.notification?.type?.toLowerCase() === "error",
        success: this.notification?.type?.toLowerCase() === "success",
      };
    },
  },
  methods: {
    clearNotification() {
      this.$store.commit("CLEAR_NOTIFICATION");
    },
  },
};
</script>
<style>
.loginPage {
  width: 50%;
  transform: translate(25vw);
}

.mainPage {
  width: 65%;
  transform: translate(25vw);
}

.homePage {
  width: 80%;
  transform: translate(10vw);
}

.registerPage {
  width: 70%;
  transform: translate(15vw);
}

#capstone-app {
  box-sizing: border-box;
  /* transform: translate(15vw); */
  margin-bottom: 60px;
}

.logoutButton {
  display: flex;
  position: fixed;
  z-index: 2;
  bottom: 0;
  background-color: #31A3C7;
  border: none;
  color: white;
  padding: 20px 65px;
  text-align: center;
  width: 1;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  font-weight: bold;
  margin: 48px 2px;
  border-radius: 8px;
  cursor: pointer;
}

.logoutButton:hover {
  background-color: #1d7996;
  color: white;
}

div #capstone-app {
  display: flex;
  justify-content: left;
  flex-direction: column;
  /* width: 80%;  */
  text-align: left;
}
</style>
