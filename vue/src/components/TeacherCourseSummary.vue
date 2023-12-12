<template>
    <h1>THIS IS THE COURSE SUMMARY COMPONENT</h1>
    <p>{{ course.courseName }}</p>
    <p>{{ course.description }}</p>

    <div v-for="student in students" v-bind:key="student.id">
        <p>{{ student.firstName }}</p>
    </div>

    <div v-for="assignment in assignments" v-bind:key="assignment.assignmentId">
        <p>{{ assignment.title }}</p>
    </div>
</template>

<script>
import TeacherService from '../services/TeacherService';

export default {
    components: {

    },
    data() {
        return {
            course: [],
            students: [],
            assignments: [],
        };
    },
    created() {
        // this part grabs the course id in the url path
        TeacherService.getCourseByCourseId(this.$route.params.courseId)
            .then((response) => {
                this.course = response.data

                // do we get the students list based on courseid ?
                TeacherService.getStudentDataByTeacher(this.$store.state.user.userId)
                    .then((studentsResponse) => {
                        this.students = [...studentsResponse.data];
                    })

                TeacherService.getAssignmentsByCourseId(this.$route.params.courseId)
                    .then((assignmentsResponse) => {
                        this.assignments = assignmentsResponse.data;
                    })
            })
        // we might need something here for a potential race condition

        //do we need to do something that resets the return when another course is selected?
    }
}

</script>

<style scoped></style>