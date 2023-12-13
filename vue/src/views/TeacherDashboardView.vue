<template>
  <div class="main-content">
    <div class="box has-background-white-ter">
      <h1 class="title is-5 has-text-centered has-text-black">
        Welcome {{ user.firstName }} {{ user.lastName }}!
        <div><span>{{ textContent }}</span></div> </h1>
    </div>
    <div class="box has-background-white-ter has-text-black has-text-centered">
      <!-- <div class="field">
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
      </div> -->

      <div class="control">
  <label class="courses">
    <input type="radio" name="courseOrStudent" :value ="true" v-model="courseOrStudent">
    Courses
  </label>
  <label class="students">
    <input type="radio" name="courseOrStudent" :value="false" v-model="courseOrStudent" >
    Students
  </label>
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
      timer:''
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
    AddCourse(){
      this.$router.push({name: 'CreateCourseView'})
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
