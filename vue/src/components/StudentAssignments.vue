<template>
    <div class="box has-background-white-ter">
        <h2><strong>Your Submitted Assignments:</strong></h2>
        <h2 class="box has-background-white-ter" v-for="assignment in assignments" v-bind:key="assignment.assignmentId">
            {{ assignment.data.title }}
            <br/>
            {{ assignment.data.description }} 
            <div v-for="question in assignment.questions" v-bind:key="question.questionId">{{ question.prompt }}
                <p>
                    {{ question.studentAnswer.answerText }}
                </p>
            </div>
        </h2>
    </div>
</template>
  
<script>
import StudentService from '../services/StudentService';

export default {
    data(){
        return {
            assignments: [],
        }
    },
    created(){
        StudentService.getAssignmentsByUserId(this.$route.params.userId)
            .then((response) => {
                this.assignments = [...response.data]

                this.assignments.forEach((assignment) => {
                    StudentService.getAssignmentByAssignmentId(assignment.assignmentId)
                        .then((assignmentResponse) => {
                            assignment.data = assignmentResponse.data
                        })
                })

                this.assignments.forEach((assignment) => {
                    StudentService.getQuestionsByAssignmentId(assignment.assignmentId)
                        .then((questionResponse) => {
                            assignment.questions = [...questionResponse.data]
                            assignment.questions.forEach((question) => {
                                StudentService.getAnswerByQuestionId(question.questionId)
                                    .then((answerResponse) => {
                                        question.studentAnswer = answerResponse.data
                                    })
                            })
                        })

                })
            })
    }
};
</script>
  
<style>

</style>
  