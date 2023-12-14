
<template>
    <div>
        <teacher-course-summary v-bind:course="course"></teacher-course-summary>
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
        this.loadData();

        // const courseId = this.$route.params.courseId;
        // // this part grabs the course id in the url path
        // TeacherService.getCourseByCourseId(courseId)
        //     .then((response) => {
        //         this.course = {
        //             ...response.data,
        //         };
        //         TeacherService.getStudentDataByTeacher(this.$store.state.user.userId)
        //             .then((studentsResponse) => {
        //                 this.course.students = []
        //                 TeacherService.getCurriculumByCourseId(this.$route.params.courseId)
        //                     .then((curriculumResponse) => {
        //                         this.course.students = [...studentsResponse.data]
        //                         this.course.curriculum = []
        //                         curriculumResponse.data.forEach((curriculum) => {
        //                             // check if the service is working 
        //                             TeacherService.getAssignmentByCurriculumId(curriculum.curriculumElementId)
        //                             .then((assignmentResponse) => {
        //                                 this.course.curriculum.push({
        //                                     ...curriculum,
        //                                     assignments: assignmentResponse.data
        //                                 })
        //                             })
        //                         })
        //                     })
        //             })

        //     })
    },

    methods: {
        async loadData() {

            try {
                const courseId = this.$route.params.courseId;
                const userId = this.$store.state.user.userId;

                // Get the course
                const courseResponse = await TeacherService.getCourseByCourseId(courseId);
                const course = courseResponse.data;

                // Get the students data
                const studentsResponse = await TeacherService.getStudentDataByTeacher(userId);
                const students = studentsResponse.data;

                // Get the Lectures / Curriculum
                const curriculumResponse = await TeacherService.getCurriculumByCourseId(courseId);
                const curriculum = curriculumResponse.data;

                // Get the assignments for each lecture
                for (const lecture of curriculum) {
                    // Get assignments for current lecture
                    const assignmentsResponse = await TeacherService.getAssignmentByCurriculumId(lecture.curriculumElementId);
                    const assignments = assignmentsResponse.data;

                    // Store the assignments as part of the lecture object
                    lecture.assignments = assignments;
                }
                
                // Fill the course object with all of the data that we collected above
                this.course = {
                    ...course,
                    students: students,
                    curriculum: curriculum
                };

                
            } catch(ex) {
                console.log("Error", ex);
            }
        }
    }

};
</script>

<style></style>