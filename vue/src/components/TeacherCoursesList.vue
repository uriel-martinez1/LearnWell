<template>
    <div class="box">
        <ul v-for="course in this.courses" v-bind:key="course.courseId">
            <li class="title is-4">Course Name: {{ course.courseName }}</li>
            <div v-for="curricula in course.curriculum" v-bind:key="curricula.curriculumElementId">
                <a v-on:click="selectCurriculumElement(curricula.curriculumElementId)">Curricula: {{ curricula.description }}</a>
            </div>
        </ul>
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
        selectCurriculumElement(id){
            this.$router.push({name: 'TeacherCurriculumView', params: {'elementId': id}})
        }
    }
}

</script>

<style></style>

