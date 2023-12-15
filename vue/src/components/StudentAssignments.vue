<template>
    <div class="box">
        <h1 h1 class="title is-3 has-text-centered">Your Submitted Assignments:</h1>
        <h2 class="box" v-for="assignment in assignments" v-bind:key="assignment.assignmentId">
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
                                // this is grabbing a question by question id front and back end but needs to be associated with submitted assignment or answerid^
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
  