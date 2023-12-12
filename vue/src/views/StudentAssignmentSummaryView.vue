<template>
    <student-assignment-summary></student-assignment-summary>
</template>

<script>
import StudentAssignmentSummary from '../components/StudentAssignmentSummary.vue';
import StudentService from '../services/StudentService';

export default {
    components: {
        StudentAssignmentSummary,
    },
    data(){
        return {
            assignments: []
        }
    },
    created() {
        StudentService.getAssignmentsByCurriculumId(this.$route.params.curriculumElementId)
            .then((curriculumResponse) => {
                this.assignments = curriculumResponse.data
                console.log(this.assignments)
            })
    },

}
</script>

<style></style>