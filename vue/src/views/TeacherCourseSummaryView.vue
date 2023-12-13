
<template>
    <div>
        <teacher-course-summary></teacher-course-summary>
    </div>
</template>

<script>
import TeacherCourseSummary from '../components/TeacherCourseSummary.vue';
import TeacherService from '../services/TeacherService';

export default {
    components: {
        TeacherCourseSummary,
    },
    data() {
        return {
            course: {}
        }
    },

    created() {
        // this part grabs the course id in the url path
        TeacherService.getCourseByCourseId(this.$route.params.courseId)
            .then((response) => {
                this.course = {
                    ...response.data,
                }
                TeacherService.getStudentDataByTeacher(this.$store.state.user.userId)
                    .then((studentsResponse) => {
                        this.course.students = []
                        TeacherService.getCurriculumByCourseId(this.$route.params.courseId)
                            .then((curriculumResponse) => {
                                this.course.students = [...studentsResponse.data]
                                this.course.curriculum = []
                                curriculumResponse.data.forEach((curriculum) => {
                                    // check if the service is working 
                                    TeacherService.getAssignmentsByCurriculumId(curriculum.curriculumElementId)
                                    .then((assignmentResponse) => {
                                        this.content.curriculum.push({
                                            ...curriculum,
                                            assignments: assignmentResponse.data
                                        })
                                    })
                                })
                            })
                    })

            })
    }

};
</script>

<style></style>