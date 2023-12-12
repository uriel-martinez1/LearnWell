<template>
    <div v-if="assignmentElements[0] != undefined">
        <div v-for="assignment in assignmentElements" v-bind:key="assignment.assignmentId"
            class="box has-background-white-ter has-text-black">
            <assignment-details :assignment="assignment"></assignment-details>
        </div>
    </div>
</template>

<script>
import StudentService from '../services/StudentService';
import AssignmentDetails from '@/components/AssignmentDetails.vue'
export default {
    components: {
        AssignmentDetails
    },
    data() {
        return {
            assignmentElements: [],
            questions: [],
        }
    },
    methods: {
        getQuestionsByAssignmentId(assignmentId) {
            // StudentService.getQuestionsByAssignmentId(assignmentId)
            //     .then((questionResponse) => {
            //         this.questions = questionResponse.data

            //     })
        }

    },
    created() {
        StudentService.getAssignmentsByCurriculumId(this.$route.params.curriculumElementId)
            .then((assignmentResponse) => {
                this.assignmentElements = assignmentResponse.data
                console.log(this.assignmentElements)
            })
        },

}
</script>
<style></style>
