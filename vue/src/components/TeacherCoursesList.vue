<template>
    <!-- <div id="main" class="box has-background-white-ter has-text-black">
        <ul v-for="course in this.courses" :key="course.courseId">
            <li class="title is-5 has-text-black">{{ course.courseName }}</li>
            <button @click="EditCourse(course.courseId)" class="button is-link is-outlined is-small">
                Edit Course
            </button>
            <div v-for="curricula in course.curriculum" :key="curricula.curriculumElementId">
                <a @click="selectCurriculumElement(curricula.curriculumElementId)" class="has-text-black">
                    {{ curricula.description }}
                </a>

                <button @click="EditCurriculumView(curricula.curriculumElementId, course.courseId)"
                    class="button is-link is-outlined is-small">
                    Edit
                </button>
            </div>
            <button @click="CreateCurriculumView(course.courseId)" class="button is-link is-outlined is-small">
                Add curriculum
            </button>
        </ul>
     
         <div class="mt-4">
            
            <button v-on:click="AddCourse" class="button is-link is-small">Add Course</button>
        </div> 
    </div> -->
    <div id="main" class="box has-background-white-ter has-text-black"><h1 class="title">Courses</h1>
        <table class="table is-striped is-hoverable is-fullwidth" v-for="course in this.courses" :key="course.courseId">
            <thead>
                <tr>
                    <th class="title is-5 is-success">{{ course.courseName }}</th>
                    <th><button @click="EditCourse(course.courseId)" class="button is-link is-outlined is-small">Edit
                            Course</button></th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="curricula in course.curriculum" :key="curricula.curriculumElementId">
                    <td>{{ curricula.description }}</td>
                    <td><button @click="EditCurriculumView(curricula.curriculumElementId, course.courseId)"
                            class="button is-link is-outlined is-small">Edit</button></td>
                </tr>
            </tbody>
            <button @click="CreateCurriculumView(course.courseId)" class="button is-ghost is-default">
                Add curriculum
            </button>
        </table>
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

    }
}

</script>

<style>
#main {
    padding: 10vh;
}
</style>



