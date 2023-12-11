<template>
  <div class="main-content">
    <div class="box has-background-white-ter">
      <h1 class="title is-5 has-text-centered has-text-black">
        Teacher: {{ user.firstName }} {{ user.lastName }}
        <div><span id="datetime"></span></div> </h1>
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

  </div>
</template>

<script>

import TeacherService from "../services/TeacherService";
import StudentList from "../components/TeacherStudentList.vue";
import TeacherCoursesList from "../components/TeacherCoursesList.vue";

function updateDateTime() {
      const now = new Date();
      const currentDateTime = now.toLocaleString();
      document.querySelector('#datetime').textContent = currentDateTime;
    }
    setInterval(updateDateTime, 10000000);
export default {
  components: {
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
.todayDate {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 50px;
  padding-top: 30px;
}
</style>
