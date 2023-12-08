<template>
    <div>
        <ul v-for="course in this.courses" v-bind:key="course.courseId">
            <li>Course Name: {{ course.courseName }}</li>
            <div v-for="curricula in course.curriculum" v-bind:key="curricula.curriculumElementId" v-on:click="viewCurriculum(curricula.curriculumElementId)">
                <li>Curricula: {{ curricula.description }}</li>
            </div>
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
            this.$router.push({name: "StudentCurriculumView", params:{elementId: id}})
        }
    },
    created() {
        StudentService.getCoursesByStudentId(this.$store.state.user.userId)
            .then((response) => {

                this.courses = response.data;

                this.courses.forEach((course) => {
                    StudentService.getCurriculumByCourseId(course.courseId)
                        .then((response) => {
                            console.log(response.data, "GET CURRICULUM BY COURSE ID")
                            course.curriculum = (response.data)
                            // course.curriculum.forEach((curriculumElement) => {
                            //     StudentService.getAssignmentsByCurriculumId(curriculumElement.curriculumElementId)
                            //         .then((response) => {
                            //             course.curriculum.assignment = (response.data)
                            //         })
                            // })
                        })
                })
            })
    }
}

</script>

<style></style>

