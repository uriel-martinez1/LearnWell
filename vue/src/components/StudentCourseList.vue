<template>
    <div v-if="courses[0] != undefined">
        <ul v-for="course in this.courses" v-bind:key="course.courseId">
            <li v-on:click="goToCourse(course.courseId)">{{ course.courseName }}</li>
            <!-- <div v-for="curricula in course.curriculum" v-bind:key="curricula.curriculumElementId"
             v-on:click="viewCurriculum(curricula.curriculumElementId)">
                <li>{{ curricula.description }}</li>
            </div> -->
        </ul>
    </div>
</template>

<script>
import StudentService from '../services/StudentService';

export default {
    components: {

    },
    data() {
        return {
            courses: []
        };
    },
    methods: {
        viewCurriculum(id){
            this.$router.push({name: "StudentCurriculumView", params:{'elementId': id}})
        },
        goToCourse(courseId) {
            this.$router.push({name: "StudentCourseView", params: {'courseId': courseId}})
            // this.$router.push({name: "StudentCourseView", params: {courseId : courseId}})
        },

    },
    created() {
        StudentService.getCoursesByStudentId(this.$store.state.user.userId)
            .then((response) => {
                this.courses = [...response.data]
                this.courses.forEach((course) => {
                    course.curriculum = []
                    StudentService.getCurriculumByCourseId(course.courseId)
                    .then((curriculumResponse) => {
                            course.curriculum.push(curriculumResponse.data)
                        })
                })
            })
    }
}

</script>

<style></style>

