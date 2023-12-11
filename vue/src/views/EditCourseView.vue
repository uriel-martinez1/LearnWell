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
            course: {
                name: '',
                description: '',
                difficulty: 0,
                updated: new Date(),
                // unsure about how to toggle active
                active: 0,
            }
        }
    },
    created() {
        let courseId = parseInt(this.$route.params.courseId);
        if (courseId != 0) {
            TeacherService.getCourseByTeacherId(this.$route.params.userId, courseId)
                .then((response) => {
                    this.course = response.data;
                })
                .catch(error => {
                    if (error.response && error.response.status === 404) {
                        this.$store.commit('SET_NOTIFICATION', `Error getting course ${courseId}. This course may have been deleted or you have entered an invalid course ID.`);
                        this.$router.push({ name: 'TeacherDashboardView', params: {id: this.$route.params.userId} });
                    }
                });
        }
    }

}
</script>

<style></style>