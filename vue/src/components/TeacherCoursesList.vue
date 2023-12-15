<template>
    <!--Table Design-->
    <div id="main" class="box has-background-white-ter has-text-black">
        <h1 class="title has-text-centered">Course Sections</h1>
        <table class="table is-striped is-hoverable is-fullwidth" v-for="course in this.courses" :key="course.courseId">
            <thead>
                <tr>
                    <th @click="EditCourse(course.courseId)" class="title is-5 is-success">{{ course.courseName }}</th>
                    <th style="text-align: right;" class="is-success"><button @click="EditCourse(course.courseId)"
                            class="button is-link is-light is-small ">Edit
                            Course</button></th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="curricula in course.curriculum" :key="curricula.curriculumElementId">
                    <td @click="selectCurriculumElement(curricula.curriculumElementId)">{{ curricula.description }}</td>
                    <td style="text-align: right;"><button
                            @click="EditCurriculumView(curricula.curriculumElementId, course.courseId)"
                            class="button is-link is-outlined is-small">Edit</button></td>
                </tr>
            </tbody>
            <button @click="CreateCurriculumView(course.courseId)" class="button is-success is-outlined">Add
                curriculum</button>
        </table>
        <div class="mt-4">
            <button v-on:click="AddCourse" class="button is-success is-default">Add Course</button>
        </div>
    </div>

    <!--Card design-->
    <div class="box">
        <h1 class="title has-text-centered">Courses</h1>
        <br/>
        <div>
            <div class="card mb-4" v-for="course in this.courses" :key="course.courseId">
                <div class="content">
                    <table class="table is-fullwidth">
                        <tbody>
                            <td class="title is-4" v-on:click="GoToCourse(course.courseId)">{{ course.courseName }}</td>
                            <td style="text-align: right; text-transform: capitalize;">
                                <button @click="EditCourse(course.courseId)" class="button is-success is-normal ">Edit
                                    Course
                                </button>
                            </td>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>
        <div class="mt-4">
            <button v-on:click="AddCourse" class="button is-success is-default">Add Course</button>
        </div>
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
                //add a mutation to the store here to populate the data about courses by teacher id to use in the teacher sidebar
                if (this.$store.state.sideBarData.length < this.courses.length) {
                    this.courses.forEach((course) => {
                        this.$store.commit('SET_SIDEBAR_DATA', course)
                    })
                }
            })
    },
    methods: {
        EditCourse(id) {
            this.$router.push({ name: 'EditCourseView', params: { 'courseId': id }, query: { action: 'edit' } })
        },
        selectCurriculumElement(id) {
            this.$router.push({ name: 'TeacherCurriculumView', params: { 'elementId': id } })
        },

        CreateCurriculumView(courseId) {
            this.$router.push({ name: 'CreateCurriculumView', params: { 'courseId': courseId } })
        },

        EditCurriculumView(elementId, courseId) {
            this.$router.push({ name: 'EditCurriculumView', params: { 'elementId': elementId, 'courseId': courseId }, query: { action: 'edit' } })
        },
        AddCourse() {
            this.$router.push({ name: 'CreateCourseView' })
        },

        // go to course summary page based on course id
        GoToCourse(id) {
            this.$router.push({name: 'CourseSummaryView', params: {'courseId': id}})
        }

    }
}

</script>

<style>
/* #main {
    padding: 5vh;
} */

td {
    cursor: pointer;
}
</style>



