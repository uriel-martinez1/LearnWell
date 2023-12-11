<template>
  <div class="main-content">
    <div class="box has-background-white-ter">
      <section class="todayDate">
        <h2 class="title is-5 has-text-centered has-text-black">Welcome back, {{ user.firstName }} {{ user.lastName }}!
        </h2>
        <div>
          <span id="datetime"></span>
        </div>
      </section>
      <h1><strong>Overview</strong></h1>
      <p>LearnWell streamlines course organization and assignment management for teachers, while providing students with
        easy access to homework, submission, and teacher communication.
      </p>
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
    </div>
  </div>
  <student-course-list></student-course-list>
</template>
  
<script>

import StudentService from "../services/StudentService"
import StudentCourseList from "../components/StudentCourseList.vue"

function updateDateTime() {
  const now = new Date();
  const currentDateTime = now.toLocaleString();
  document.querySelector('#datetime').textContent = currentDateTime;
}
setInterval(updateDateTime, 1000);
export default {
  components: {
    StudentCourseList,

  },
  data() {
    return {
      user: {},
      courses: {},

    };
  },
  created() {
    StudentService.getStudentData(this.$store.state.user.userId)
      .then((response) => {
        this.user = response.data;
      });
    console.log(this.$store.state.user.role)
  },
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
}</style>