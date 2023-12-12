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
<!-- created()this.route. curriculum id then in student service to
    get assignment by curriculum id; created is life cycle hook. Once these things are creted in the DOM, go get me this data -->
<style></style>