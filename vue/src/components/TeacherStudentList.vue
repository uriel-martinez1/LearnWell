<template>
    <div class="box">
        <div v-for="student in this.students" v-bind:key="student.studentId">
            <h1>Student Name: {{ student.firstName }} {{ student.lastName }}</h1>
            <div v-for="course in student.courses" v-bind:key="course.courseId">
                <h2> Class: {{ course.courseName }}</h2>
                <curriculum-element v-bind:course-id="course.courseId"></curriculum-element>
            </div>
        </div>
    </div>
</template>

<script>
import TeacherService from '../services/TeacherService';
import CurriculumElement from '../components/CurriculumElement.vue';
export default {
    components: {
        CurriculumElement,
    },
    data() {
        return {
            students: []
        };
    },
    created() {
        TeacherService.getStudentDataByTeacher(this.$store.state.user.userId)
            .then((response) => {
                this.students = response.data;

                this.students.forEach((student) => {
                    TeacherService.getStudentCoursesByStudentUsername(student.username)
                        .then((response) => {
                            student.courses = (response.data)
                        })
                })

            });
    },

}



</script>

<style></style>