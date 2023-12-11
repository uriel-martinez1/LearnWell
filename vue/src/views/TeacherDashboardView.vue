<template>
  <!-- OLD CODE THAT IS ASSOCIATED WITH STYLING BELOW -->
  <!-- <div class="sidebar">
    <side-bar-teacher-dashboard></side-bar-teacher-dashboard>
  </div>
  <div class="grid-container">
    <section class="todayDate">
      <h2>Welcome back, Sarah!</h2>
      <div>Tuesday November 30, 2023</div>
    </section>
    <h1><strong>Overview</strong></h1>
    <p>LearnWell streamlines course organization and assignment management for teachers, while providing students with
      easy access to homework, submission, and teacher communication.
    </p>
    <div class="buttons">
      <a class="button is-link is-outlined"><router-link v-bind:to="{ name: 'TeacherDashboardView' }"><strong>Get
            Started</strong></router-link></a>
    </div>
  </div>
 

   NEW CODE PULLED FROM MAIN -->
  <!-- <div class="sidebar">
    <side-bar-teacher-dashboard></side-bar-teacher-dashboard>
  </div> -->
  <div class="main-content">
    <div class="box has-background-white-ter">
      <h1 class="title is-5 has-text-centered has-text-black">
        Teacher: {{ user.firstName }} {{ user.lastName }}
      </h1>
    </div>
    <div class="box has-background-white-ter has-text-black">
      <div class="field">
        <label for="courses"></label>
        <div class="control">
          <label class="radio">
            <input id="courses" name="courseOrStudent" type="radio" :value="true" v-model="courseOrStudent" />
            Courses
          </label>
        </div>
      </div>

      <div class="field">
        <label for="students"></label>
        <div class="control">
          <label class="radio">
            <input id="students" name="courseOrStudent" type="radio" :value="false" v-model="courseOrStudent" />
            Students
          </label>
        </div>
      </div>
    </div>
      <teacher-courses-list v-if="this.courseOrStudent"></teacher-courses-list>
      <student-list v-else></student-list>
      <!--Missing the v-on:to to reroute to new view AddCardView-->
      <button v-on:click="() => this.$router.push({name: 'CreateCoursesView'})">Add Course</button>
    
    <!-- <div class="grid-container">
      <h1>Welcome to Your Teacher Dashboard!</h1>
      <P>LearnWell streamlines course organization and assignment management for teachers, while providing students with
        easy access to homework, submission, and teacher communication.</P>
      <div class="buttons">
        <a class="button is-link is-outlined"><router-link v-bind:to="{name: 'TeacherDashboardView'}"><strong>Get Started</strong></router-link></a>
      </div>
    </div>  -->
  </div>
</template>

<script>
import SideBarTeacherDashboard from "../components/Teacher/SideBarTeacherDashboard.vue";

import TeacherService from "../services/TeacherService";
import StudentList from "../components/TeacherStudentList.vue";
import TeacherCoursesList from "../components/TeacherCoursesList.vue";

export default {
  components: {
    // SideBarTeacherDashboard,
    StudentList,
    TeacherCoursesList,
},
  data() {
    return {
      courseOrStudent: true,
      user: {},
    };
  },
  created() {
    TeacherService.getTeacherData(this.$store.state.user.userId).then(
      (response) => {
        this.user = response.data;
      }
    );
  },
};
</script>

<style>
#main-content {
  height: 100vh;
}

/* div .flex-container {
  display: flex;
  justify-content: left;
  flex-direction: column;
  width: 80%;
  margin-left: 20%;
  padding-right: 10px;
  text-align: left;
} */

.todayDate {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 50px;
  padding-top: 30px;
}

/* footer {
  position: fixed;
  padding-left: 5%;
  padding-top: 0;
  left: 0;
  bottom: 0;
  width: 100%;
  background-color: #04aa6d;
  color: white;
  text-align: left;
} */


</style>
