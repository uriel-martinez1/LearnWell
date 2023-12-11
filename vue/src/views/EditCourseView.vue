<template>
    <div>
        <h1>Edit Course</h1>
        <create-course v-bind:course="course"></create-course>
    </div>
</template>

<script>
import CreateCourse from '../components/CreateCourse.vue';
import TeacherService from '../services/TeacherService';

export default {
    components: {
        CreateCourse,
    },
    data() {
        return {
            course: {}
        }
    },
    created() {

        TeacherService.getCourseByCourseId(this.$route.params.courseId)
            .then((response) => {
                this.course = response.data;
            })
            // .catch(error => {
            //     if (error.response && error.response.status === 404) {
            //         this.$store.commit('SET_NOTIFICATION', `Error getting course ${this.$route.params.courseId}. This course may have been deleted or you have entered an invalid course ID.`);
            //         this.$router.push({ name: 'TeacherDashboardView', params: { 'id': this.$store.state.userId } });
            //     }
            // });
    }

}
</script>

<style></style>