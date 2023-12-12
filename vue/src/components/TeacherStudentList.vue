<template>
    <div class="box has-background-white-ter has-text-black">
        <div v-for="student in students" :key="student.studentId">
            <h1 class="title is-4 has-text-black">{{ student.firstName }} {{ student.lastName }}</h1>
            <div v-for="course in student.courses" :key="course.courseId">
                <h2 class="subtitle is-6 has-text-link">{{ course.courseName }}</h2>
                <!-- <curriculum-element :course-id="course.courseId"></curriculum-element> -->
            </div>
        </div>
    </div>
</template>

<script>
import TeacherService from '../services/TeacherService';
// import CurriculumElement from '../components/CurriculumElement.vue';
export default {
    components: {
        // CurriculumElement,
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