<template>
    <div>
        <ul v-for="course in this.courses" v-bind:key="course.courseId">
            <li>Course Name: {{ course.courseName }}</li>
            <div v-for="curricula in course.curriculum" 
            v-bind:key="curricula.curriculumElementId">
            <li>Curricula: {{ curricula.description }}</li>
        </div>
        </ul>
    </div>
</template>

<script>
import TeacherService from '../services/TeacherService';

export default {
    components: {

    },
    data() {
        return {
            courses: []
        };
    }, 
    created() {
        TeacherService.getCoursesByTeacherId(this.$store.state.user.userId)
        .then((response) => {
            this.courses = response.data;

            this.courses.forEach((course) => {
                TeacherService.getCurriculumByCourseId(course.courseId)
                .then((response) => {
                    course.curriculum = (response.data)
                })
            })
        })
    }
}

</script>

<style></style>

