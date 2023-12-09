<template>
  <div id="capstone-app">
      <router-link class="logoutButton" type="button" v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
   </div> 
   <div class="sidebar" v-if="$store.state.token != ''">
      <side-bar-student-dashboard v-if="$store.state.user.role === 'student'"></side-bar-student-dashboard>
      <side-bar-teacher-dashboard v-else></side-bar-teacher-dashboard>
    </div>
  <router-view />
  <div class="footer">
            <footer>
            <p>
                Copyright ©-All rights are reserved 
            </p>
            </footer>
        </div>
</template>
<!-- create component using above to go on other views; use this id- "nav" -->
<script>
import SideBarStudentDashboard from './components/Student/SideBarStudentDashboard.vue';
import SideBarTeacherDashboard from './components/Teacher/SideBarTeacherDashboard.vue';
export default{
  components: {
    SideBarStudentDashboard,
    SideBarTeacherDashboard
  }
}
</script>
<style>

 .logoutButton {
  position: fixed;
  margin-left: 0;
  margin-bottom: 10px;
  bottom: 0;
  color: white;
  text-align: center;
  z-index: 2;
}
.logoutButton{
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
    /* margin-left: 13%; */
    bottom: 0;
    height: 5%;
    width: 100%;
    background-color: #04AA6D;
    color: white;
    text-align-last: right;
  }
</style>
