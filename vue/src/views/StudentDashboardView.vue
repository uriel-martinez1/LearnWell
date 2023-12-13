<template>
  <div v-if="user.firstName" class="main-content">
    <div class="box has-background-white-ter">
      <section class="todayDate">
        <h2 class="title is-5 has-text-centered">Welcome back, {{ user.firstName }} {{ user.lastName }}!
          <div>
            <span>{{ textContent }}</span>
          </div>
        </h2>
      </section>
      <h1><strong>Overview</strong></h1>
      <p>LearnWell streamlines course organization and assignment management for teachers, while providing students with
        easy access to homework, submission, and teacher communication.
      </p>
    </div>
    <div v-if="courses[0] != undefined">
      <ul v-for="course in this.courses" v-bind:key="course.courseId">
        <div v-on:click="goToCourse(course.courseId)" class="box has-background-white-ter has-text">
          <li>{{ course.courseName }}</li>
        </div>
      </ul>
    </div>
  </div>
</template>
  
<script>

import StudentService from "../services/StudentService"

export default {

  data() {
    return {
      user: {},
      courses: [],
      textContent: '',
      timer: ''
    };
  },
  created() {
    StudentService.getStudentData(this.$store.state.user.userId)
      .then((studentResponse) => {
        StudentService.getCoursesByStudentId(this.$store.state.user.userId)
          .then((courseResponse) => {
            this.user = studentResponse.data;
            this.courses = [...courseResponse.data]
          })
      })
    this.timer = setInterval(this.updateDateTime, 1000);
  },
  methods: {
    goToCourse(courseId) {
      this.$router.push({ name: "StudentCourseSummaryView", params: { 'courseId': courseId } })
      // this.$router.push({name: "StudentCourseView", params: {courseId : courseId}})
    },
    updateDateTime() {
      const now = new Date();
      const currentDateTime = now.toLocaleString();
      this.textContent = currentDateTime;
    }
  }
};
</script>

<style>
.todayDate {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 50px;
  padding-top: 30px;
}

.main-content {
  width: 100%;
}

li {
  cursor: pointer;
}
</style>