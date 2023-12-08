<template>
    <!-- Add a button thats accessable only to the teacher (v-if user.role === teacher), to toggle editing on the curriculum element, otherwise it will be in the view only format -->
    <div>
        <!-- v-if to toggle the view vs the edit curriculum element -->
            <!-- VIEW ONLY -->
            <!-- Editable version ==> multiple inputs/rich text areas within a form -->
                <!-- save button to save changes to the curriculum element ==> this will be our submit for the form -->
                    <!-- when you submit we call the editCurriculum endpoint on the server and pass it the new curriculum element -->
                    <!-- after you click the submit button we re-render the curriculum element view -->
        <div class="ShowCurriculumView" v-if="show">
            <!---Show curriculum view/VIEW ONLY-->
        </div>

        <p class="title is-3">{{ this.content.description }}</p>
        <p class="subtitle is-5">Course content: {{ this.content.lectureContent }}</p>
    </div>
</template>

<script>
import TeacherService from '../services/TeacherService';


export default {
    props: ['elementId'],
    data() {
        return {
            content: {},
        }
    },
    created() {
        TeacherService.getCurriculumElementById(this.elementId)
            .then((response) => {
                this.content = response.data;
            })
    }
}

</script>

<style></style>