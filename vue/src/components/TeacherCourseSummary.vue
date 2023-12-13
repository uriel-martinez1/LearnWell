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

    <div class="box">
        <h1 class="is-size-1"><strong>{{ course.courseName }}</strong></h1>
        <h2 class="is-size-3">{{ course.description }}</h2>
        <br />
        <u>Lectures</u>
        <table class="table">
            <thead>
                <tr>
                    <th>Lectures</th>
                    <th>Title</th>
                    <th>Name</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="curriculum in course" :key="curriculum.curriculumId">
                    <td>{{ curriculum.description }}</td>
                </tr>
                <tr v-for="assignments in course" :key="assignments.assignmentId">
                    <td class="is-size-4">{{ assignments.title }}</td>
                </tr>
                <tr v-for="student in course.students" :key="student.userId">
                    <td class="is-size-4">{{ student.firstName }} {{ student.lastName }}</td>
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
        content: {
            type: Object,
            default() {
                return {};
            },
        },
    },
    data() {
        return {
            course: {
                courseId: this.course.courseId,
                teacherId: this.course.userId,
                courseName: this.course.courseName,
                description: this.course.description,
                difficulty: this.course.difficulty,
                cost: this.course.cost,
                createdDate: this.course.createdDate,
                lastUpdated: this.course.lastUpdated,
                isActive: this.course.isActive,
                students: this.course.students,
                curriculum: this.course.curriculum,
                assignments: this.course.assignments,
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