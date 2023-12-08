<template>
    <div>
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
        console.log(this.elementId)
        TeacherService.getCurriculumElementById(this.elementId)
            .then((response) => {
                this.content = response.data;
            })
    }
}

</script>

<style></style>