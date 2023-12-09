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
    created(){
        TeacherService.getCurriculumElementById(this.$route.params.elementId)
            .then((response) => {
                StudentService.getAssignmentsByCurriculumId(this.$route.params.elementId)
                    .then((assignmentResponse) => {
                        assignmentResponse.data.forEach((element) => {
                            StudentService.getQuestionsByAssignementId(element.assignmentId)
                                .then((questionResponse)=> {
                                    this.content = { 
                                        ...response.data,
                                        assignments: assignmentResponse.data,
                                        //GRAB THE QUESTIONS ASSOCIATED WITH THE ASSIGNMENT AS WELL, POPULATE STATE WITH RETURN DATA   
                                        questions: questionResponse.data,
                                    }
                                })
                        })
                    })
            })
            
    }
}
</script>

<style></style>