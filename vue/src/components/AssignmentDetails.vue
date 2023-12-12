<template>
    <div>
        <li @click="showQuestions = !showQuestions">{{ assignment.description }}</li>
            <li v-show="showQuestions" v-for="question in assignment.questions" v-bind:key="question.question_id">{{ question.prompt }}</li>

    </div>
</template>
<script>
export default {
    props: ['assignment'],
    data(){
        return {
            showQuestions: false
        }
    }
}
</script>
<style></style>