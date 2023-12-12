<template>
    <student-assignment-summary></student-assignment-summary>
</template>

<script>
import StudentAssignmentSummary from '../components/StudentAssignmentSummary.vue';

export default {
    components: {
        StudentAssignmentSummary,
    }
}
</script>
<!-- created()this.route. curriculum id then in student service to
    get assignment by curriculum id; created is life cycle hook. Once these things are creted in the DOM, go get me this data -->
<style></style>