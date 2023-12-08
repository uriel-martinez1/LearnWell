<template>
    <create-curriculum v-bind:content="this.content" v-if="content.courseId != undefined"></create-curriculum>
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
                this.content = response.data
            })
    }
}
</script>

<style></style>