<template>
    <create-curriculum v-bind:content="this.content"></create-curriculum>
</template>

<script>
import CreateCurriculum from '../components/CreateCurriculum.vue'
import TeacherService from '../services/TeacherService';

export default {
    data(){
        return{
            content :{}
        }
    },
    components: {
        CreateCurriculum,
    },
    created(){
        TeacherService.getCurriculumElementById(this.$route.params.elementId)
            .then((response) => {
                console.log(response.data, "INSIDE CREATED getting CURRICULUM ELEMENT")
                this.content = response.data
            })
    }
}
</script>

<style></style>