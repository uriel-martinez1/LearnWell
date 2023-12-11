<template>
    <div id="main" class="box has-background-white-ter has-text-black">
        <ul v-for="course in this.courses" :key="course.courseId">
            <li class="title is-5 has-text-black">Course Name: {{ course.courseName }}</li>
            <button @click="EditCourse(course.courseId)" class="button is-link is-outlined is-small">
                Edit Course
            </button>
            <div v-for="curricula in course.curriculum" :key="curricula.curriculumElementId">
                <a @click="selectCurriculumElement(curricula.curriculumElementId)" class="has-text-black">
                    Curricula: {{ curricula.description }}
                </a>

                <button @click="EditCurriculumView(curricula.curriculumElementId)"
                    class="button is-link is-outlined is-small">
                    Edit
                </button>
            </div>
            <button @click="CreateCurriculumView" class="button is-link is-outlined is-small">
                Add curriculum
            </button>
        </ul>
        <!-- Add a course to the teacher's panel -->
        <!-- <div class="mt-3">
            <button @click="AddCourseView" class="button is-link is-outlined is-small">Add Course</button>
        </div> -->
        <button v-on:click="AddCourse" class="button is-link">Add Course</button>

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
    },
    methods: {
        EditCourse(id) {
            this.$router.push({ name: 'EditCourseView', params: { 'courseId': id }, query: { action: 'edit' } })
        },
        selectCurriculumElement(id) {
            this.$router.push({ name: 'TeacherCurriculumView', params: { 'elementId': id } })
        },

        CreateCurriculumView() {
            this.$router.push({ name: 'CreateCurriculumView' })
        },

        EditCurriculumView(id) {
            this.$router.push({ name: 'EditCurriculumView', params: { 'elementId': id }, query: { action: 'edit' } })
        },
        AddCourse() {
            this.$router.push({ name: 'CreateCourseView' })
        },

    }
}

</script>

<style>
#main{
    padding:10vh;
}
</style>



