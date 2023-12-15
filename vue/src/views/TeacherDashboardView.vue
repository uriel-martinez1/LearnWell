<template>
  <div class="main-content">
    <div class="box">
      <h1 class="title is-3 has-text-centered has-text-black">
        Welcome {{ user.firstName }} {{ user.lastName }}!
        <div><span>{{ textContent }}</span></div>
      </h1>
    </div>
    <div class="box has-text-black has-text-centered">

      <div class="control">
        <div class="tabs is-centered is-large has-text-weight-bold">
          <ul>
            <li :class="{ 'is-active': courseOrStudent === true }" v-on:click="courseOrStudent = true">
              <a>Courses</a>
            </li>
            <li :class="{ 'is-active': courseOrStudent === false }" v-on:click="courseOrStudent = false"><a>Students</a>
            </li>
          </ul>
        </div>
      </div>

    </div>
    <teacher-courses-list v-if="this.courseOrStudent"></teacher-courses-list>
    <student-list v-else></student-list>
  </div>
</template>

<script>

import TeacherService from "../services/TeacherService";
import StudentList from "../components/TeacherStudentList.vue";
import TeacherCoursesList from "../components/TeacherCoursesList.vue";

export default {
  components: {
    StudentList,
    TeacherCoursesList,
  },
  data() {
    return {
      courseOrStudent: true,
      user: {},
      textContent: '',
      timer: ''
    };
  },
  created() {
    TeacherService.getTeacherData(this.$store.state.user.userId).then(
      (response) => {
        this.user = response.data;
      }
    );
    this.timer = setInterval(this.updateDateTime, 1000);
  },
  methods: {
    AddCourse() {
      this.$router.push({ name: 'CreateCourseView' })
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
#main-content {
  height: 100vh;
}

.todayDate {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 50px;
  padding-top: 30px;
}
</style>
