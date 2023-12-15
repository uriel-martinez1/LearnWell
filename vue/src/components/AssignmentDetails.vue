<template>
    <div>
        <li @click="showQuestions = !showQuestions">{{ assignment.description }}</li>
        <form v-on:submit.prevent="submitAssignment()">
            <div v-show="showQuestions" v-for="(question) in answers.questions" v-bind:key="question.question_id">
                <p>{{ question.prompt }}</p>
                <textarea class="textarea" placeholder="Fill in Answer here." v-model="question.studentanswer"> </textarea>
                <!-- :disabled="" -->
                <button v-if="showQuestions" type="submit" >Submit Assignment</button>
            </div>
        </form>
    </div>
</template>
<script>
import StudentService from '../services/StudentService';
export default {
    props: ['assignment'],
    data() {
        return {
            showQuestions: false,
            answers: []
        }
    },
    methods: {
        submitAssignment() {
        //     //HERE IS WHERE YOU SEND A POST USING AXIOS
            StudentService.submitHomeworkByAssignmentId(this.$store.state.user.userId, this.$route.params.courseId,this.$route.params.curriculumElementId, this.answers)
            this.$router.push({name: "home"})
        }
    },
    created() {
        this.answers = this.assignment;
    }
}
</script>
<style></style>