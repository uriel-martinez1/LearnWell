<template>
    <div class="sidebar">
      <div>
        <h1>Learn Well</h1>
        <h2>Teacher Dashboard</h2>
      </div>
        <button type="button">Dashboard</button>
        <button v-on:click="() => showCourses = !showCourses" type="button">Courses</button>
        <div v-if="showCourses">
          <button id="courseButton" v-for="course in this.$store.state.user.courses" v-bind:key="course.courseId">{{ course.courseName }}</button>
        </div>
        <button type="button">Students</button>
        <button type="button">Notifications</button>
        <button type="button">Logout</button>
    </div>
</template>

<script>
  export default {
    data() {
      return {
        showCourses: false,
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
}
#courseButton {
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
  top: 0;
  left: 0;
  background-color: lightcyan;
  overflow-x: hidden;
}

</style>