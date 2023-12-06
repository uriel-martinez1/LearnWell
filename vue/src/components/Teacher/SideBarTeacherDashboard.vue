<template>
    <div class="sidebar">
        <h1>Learn Well</h1>
        <h2>Teacher Dashboard</h2>
        <button type="button">Dashboard</button>
        <button v-on:click="showCourses()" type="button">Courses</button>
          <button >{{ this.$store.state.user.courses }}</button>
        <button type="button">Students</button>
        <button type="button">Notifications</button>
        <button type="button">Logout</button>
    </div>
</template>

<script>
  export default {
    data() {
      return{

      }
    },
    props: {
      
    },
    computed: {

    },
    methods: {
      showCourses() {

      }
    }
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