<template>
    <create-curriculum v-bind:content="this.content" v-if="content.courseId != undefined"></create-curriculum>
</template>

<script>
import CreateCurriculum from '../components/CreateCurriculum.vue'
import TeacherService from '../services/TeacherService';
import StudentService from '../services/StudentService';

export default {
    data(){
        return{
            content :{}
        }
    },
    components: {
        CreateCurriculum,
    },
    created() {
        TeacherService.getCurriculumElementById(this.$route.params.elementId)
            .then((response) => {
                StudentService.getAssignmentsByCurriculumId(this.$route.params.elementId)
                    .then((assignmentResponse) => {
                        this.content = {
                            ...response.data,
                            assignments: assignmentResponse.data
                        }});
            })
    }
};

</script>

<style></style>