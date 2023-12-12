<template>
    <div v-if="curriculumElements[0] !=undefined">
        <div v-for="element in curriculumElements" v-bind:key="element.assignmentId" class="box has-background-white-ter has-text-black">
            <li @click="goToAssignment(assignment.assignmentId)">{{ assignment.description }}</li>
            
        </div>
    </div>
</template>

<script>
import StudentService from '../services/StudentService';

export default {
    data() {
        return {
            curriculumElements: null
        }
    },
    created() {
        StudentService.getAssignmentsByCurriculumId(this.$route.params.curriculumElementId)
            .then((assignmentResponse) => {
                this.curriculumElements = assignmentResponse.data
                console.log(this.curriculumElements)
            })
    }
}
</script>
<style></style>