<template>
  <div>
    <div class="header">
      <a class="navbar-item">
        <img class="icon" src="../icon/icons8-books-64.png">
        <p><strong>LEARNWELL</strong></p>
      </a>
      <h2><strong>Student Dashboard</strong></h2>
    </div>
    <div class="sidebar">
      <router-link class="button" :to="{ name: 'StudentDashboardView' }">Dashboard</router-link>
      <button v-on:click="() => showAssignments = !showAssignments" type="button">Assignments</button>
      <div v-if="showAssignments">
        <button id="assignmentButton"
          v-for="assignment in this.$store.state.user.courses[0].curriculumElements[0].assignments"
          v-bind:key="assignment.assignmentId">{{ assignment.title }}</button>
      </div>
      <button type="button">Notifications</button>
    </div>
  </div>
</template>

<script>
// import StudentService from "../services/StudentService"
// import StudentCourseList from "../components/StudentCourseList.vue"
export default {
  components: {
    //StudentCourseList,
  },
  data() {
    return {
      showCourses: false,
      showAssignments: false,
    }
  },
}

</script>

<style>
.sidebar button {
  background-color: #04AA6D;
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  width: 200px;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  border-radius: 8px;
  cursor: pointer;
}

.sidebar button:hover {
  background-color: lightcyan;
  color: blueviolet;
}

#assignmentButton {
  background-color: rgb(128, 31, 128);
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  width: 200px;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  border-radius: 8px;
  cursor: pointer;
}

.sidebar {
  height: 100%;
  width: 200px;
  position: fixed;
  z-index: 1;
  top: 10;
  left: 0;
  background-color: lightcyan;
  overflow-x: hidden;
}

.header {
  color: black;
  text-align: left;
  padding-left: 15px;
  padding-bottom: 10px;
  font-size: 25px;
  top: 0;
}

.navbar-item {
  text-align: left;
  padding-left: 10px;
  padding-bottom: 10px;
  font-size: 15px;
}

.icon {
  height: auto,
}</style>