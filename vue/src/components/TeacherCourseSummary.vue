<template>
    <nav class="breadcrumb is-medium is-centered" aria-label="breadcrumbs">
        <ul>
            <li><a v-on:click="backToDashboard">Dashboard</a></li>
            <li class="is-active"><a href="#" aria-current="page">{{ course.courseName }}</a></li>
        </ul>
    </nav>

    <div class="box">
        <h1 class="is-size-1"><strong>{{ course.courseName }}</strong></h1>
        <h2 class="is-size-3">{{ course.description }}</h2>

        <div class="column is-one-quarter">
            <button class="button is-success" v-on:click="EditCourse(this.$store.state.user.userId,course.courseId)">Edit Course</button>
        </div>

        <hr>
        <h2 class="is-size-3">Lectures</h2>
        <br />
        <div>
            <div class="card mb-4" v-for="curriculum in this.course.curriculum" :key="curriculum.curriculumId">
                <div class="card-content">
                    <div class="media">
                        <div class="media-content">
                            <a class="title is-4 is-hoverable"
                                v-on:click="selectCurriculumElement(curriculum.curriculumElementId)">{{
                                    curriculum.description }}</a>
                            <br />
                            <p class="subtitle is-6">Created: {{ curriculum.createdDate.split("T")[0] }}</p>
                        </div>
                    </div>

                    <div class="content" v-if="curriculum.assignments.length > 0">
                        <h6 class="title is-6">Assignments</h6>
                        <table class="table is-hoverable is-fullwidth">
                            <tbody>
                                <tr v-for="assignment in curriculum.assignments" :key="assignment.assignmentId">
                                    <td>{{ assignment.title }}</td>
                                    <td style="text-align: right; text-transform: capitalize;">
                                        <span class="tag is-light" :class="{
                                            'is-link': assignment.assignmentType === 'homework',
                                            'is-primary': assignment.assignmentType === 'quiz',
                                            'has-background-info-light': assignment.assignmentType === 'essay'
                                        }">
                                            {{ assignment.assignmentType }}
                                        </span>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <div class="auto">
            <hr>
        </div>
        <h2 class="is-size-3">Students</h2>
        <br />
        <div class="card mb-4">
            <div class="card-content">
                <table class="table is-fullwidth is-centered">
                    <thead>
                        <tr>
                            <th>First</th>
                            <th>Last</th>
                            <th>Email</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="student in this.course.students" :key="student.userId">
                            <td>{{ student.firstName }}</td>
                            <td>{{ student.lastName }}</td>
                            <td>{{ student.email }}</td>
                            <td style="text-align: left;">
                                <span class="tag is-primary">
                                    Active
                                </span>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
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
    methods: {
        selectCurriculumElement(id) {
            this.$router.push({ name: 'TeacherCurriculumView', params: { 'elementId': id } })
        },
        EditCourse(userId,courseId) {
            this.$router.push({ name: 'EditCourseView', params: { 'id': userId,'courseId': courseId }, query: { action: 'edit' } })
        },
        backToDashboard() {
            this.$router.push({ name: 'TeacherDashboardView', params: { 'id': this.$store.state.user.userId } });
        }
    
    }
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

<style scoped></style>