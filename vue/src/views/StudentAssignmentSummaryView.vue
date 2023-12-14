<template>
    <student-assignment-summary></student-assignment-summary>
</template>

<script>
import StudentAssignmentSummary from '../components/StudentAssignmentSummary.vue';

export default {
    components: {
        StudentAssignmentSummary,
    },
    data(){
        return {
            assignments: []
        }
    },
}
</script>

<style></style>