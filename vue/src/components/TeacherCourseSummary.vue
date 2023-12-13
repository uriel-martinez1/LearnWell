<template>
    <!-- <div class="box">
        <h1 class="is-size-1"><strong>{{ course.courseName }}</strong></h1>
        <h2 class="is-size-3">{{ course.description }}</h2>
        <br/>

        <u>Lectures</u>
        <div v-for="curricula in curriculum" v-bind:key="curricula.curriculumElementId">
            <h3>{{ curricula.description }}</h3>
        </div>
        <br/>
        <u>Assignments</u>
        <div v-for="assignment in assignments" v-bind:key="assignment.assignmentId">
            <h3 class="is-size-4">{{ assignment.title }}</h3>
        </div>
        <br/>
        <u>Student List</u>
        <div v-for="student in students" v-bind:key="student.id">
            <h3 class="is-size-4">{{ student.firstName }} {{ student.lastName }}</h3>
        </div>
    </div> -->

    <div class="box has-background-white-ter">
        <h1 class="is-size-1"><strong>{{ course.courseName }}</strong></h1>
        <h2 class="is-size-3">{{ course.description }}</h2>
        <br />
        <table class="table is-hoverable is-fullwidth">
            <thead>
                <tr class="has-background-success">
                    <th class="has-text-white">Lectures</th>
                    <th class="has-text-white">Created Date</th>
                    <th class="has-text-white">Assignment</th>
                    <th class="has-text-white">Assignment Type</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="curriculum in this.course.curriculum" :key="curriculum.curriculumId">
                    <td>{{ curriculum.description }}</td>
                    <td>{{ curriculum.createdDate }}</td>
                    <td>{{ curriculum.assignments[0].title }}</td>
                    <td>{{ curriculum.assignments[0].assignmentType }}</td>
                </tr>


                <!-- <tr v-for="assignments in newCourse.assignments" :key="assignments.assignmentId">
                    <td class="is-size-4">{{ assignments.title }}</td>
                </tr>
                <tr v-for="student in newCourse.students" :key="student.userId">
                    <td class="is-size-4">{{ student.firstName }} {{ student.lastName }}</td>
                </tr> -->
            </tbody>
        </table>
        <br />
        <table class="table is-hoverable is-fullwidth">
            <thead>
                <tr class=" has-background-success">
                    <th class="has-text-white">Status</th>
                    <th class="has-text-white">First</th>
                    <th class="has-text-white">Last</th>
                    <th class="has-text-white">Email</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="student in this.course.students" :key="student.userId">
                    <td>Active</td>
                    <td>{{ student.firstName }}</td>
                    <td>{{ student.lastName }}</td>
                    <td>{{ student.email }}</td>
                </tr>
            </tbody>
        </table>
        <br />
    </div>
</template>

<script>
import TeacherService from '../services/TeacherService';


export default {
    props: {
        course: {
            type: Object,
            default() {
                return {};
            },
        },
    },
    data() {
        return {
            newCourse: {
                ...this.course
            }
        }
    },
}


// export default {
//     components: {

//     },
//     data() {
//         return {
//             course: [],
//             students: [],
//             assignments: [],
//             curriculum: [],
//         };
//     },
//     created() {
//         // this part grabs the course id in the url path
//         TeacherService.getCourseByCourseId(this.$route.params.courseId)
//             .then((response) => {
//                 this.course = response.data

//                 // do we get the students list based on courseid ?
//                 TeacherService.getStudentDataByTeacher(this.$store.state.user.userId)
//                     .then((studentsResponse) => {
//                         this.students = [...studentsResponse.data];
//                     })

//                 TeacherService.getAssignmentsByCourseId(this.$route.params.courseId)
//                     .then((assignmentsResponse) => {
//                         this.assignments = assignmentsResponse.data;
//                     })
//                 TeacherService.getCurriculumByCourseId(this.$route.params.courseId)
//                     .then((curriculumResponse) => {
//                         this.curriculum = curriculumResponse.data;
//                     })
//             })
//         // we might need something here for a potential race condition

//         //do we need to do something that resets the return when another course is selected?
//     }
// }

</script>

<style scoped>

</style>