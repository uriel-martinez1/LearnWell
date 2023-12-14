<template>
    <!-- <div v-if="this.students[0]" class="box has-background-white-ter has-text-black"> -->
        <!-- <h1 class="is-size-4">Student List</h1>
        <div v-on:click="studentSummary(student.userId)" v-for="student in students" :key="student.userId">
            <a>{{ student.firstName }} {{ student.lastName }}</a>
             <div v-for="course in student.courses" :key="course.courseId"> -->
            <!-- <h2 class="subtitle is-6 has-text-black">{{ course.courseName }}</h2>
                <curriculum-element :course-id="course.courseId"></curriculum-element> -->
            <!-- </div> -->
        <!-- </div>  -->
    
    <div id="main" class="box has-background-white-ter has-text-black">
        <h1 class="title has-text-centered">Students</h1>
        <table class="table is-striped is-hoverable is-fullwidth" v-for="student in this.students" :key="student.userId">
            <thead>
                <tr>
                    <th v-on:click="studentSummary(student.userId)" class="title is-5 is-success">{{ student.firstName }} {{ student.lastName }}</th>

                </tr>
            </thead>
        </table>

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
    methods: {
        studentSummary(studentId) {
            this.$router.push({ name: 'TeacherStudentProfileView', params: { 'userId': studentId } })
        }
    },
    created() {
        TeacherService.getStudentDataByTeacher(this.$store.state.user.userId)
            .then((response) => {
                this.students = response.data;
                console.log(this.students)

                // this.students.forEach((student) => {
                //     TeacherService.getStudentCoursesByStudentUsername(student.username)
                //         .then((response) => {
                //             student.courses = (response.data)
                //         })
                // })

            });
    },

}



</script>

<style>
th {
    cursor: pointer;
}
</style>