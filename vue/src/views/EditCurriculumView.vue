<template>
    <create-curriculum v-bind:content="this.content" v-if="content.assignments != undefined"></create-curriculum>
</template>

<script>
import CreateCurriculum from '../components/CreateCurriculum.vue'
import TeacherService from '../services/TeacherService';
import StudentService from '../services/StudentService';

export default {
    data() {
        return {
            content: {}
        }
    },
    components: {
        CreateCurriculum,
    },

    created(){
        TeacherService.getCurriculumElementById(this.$route.params.elementId)
            .then((response) => {
                this.content = {
                    ...response.data
                }
                TeacherService.getSourcesByCurriculumElementId(this.$route.params.elementId)
                    .then((sourceResponse) => {
                        //WHY ARE WE USING THE STUDENT SERVICE HERE? All of this data can come from the foreign key teacherId on the courses table
                        StudentService.getAssignmentsByCurriculumId(this.$route.params.elementId)
                            .then((assignmentResponse) => {
                                this.content.sources = [...sourceResponse.data]
                                this.content.assignments = []
                                assignmentResponse.data.forEach((element) => {
                                    StudentService.getQuestionsByAssignmentId(element.assignmentId)
                                    .then((questionResponse)=> {
                                        this.content.assignments.push({
                                            ...element,
                                            questions: questionResponse.data,
                                            assignmentUpload: element.type === "text" ? 'true': 'false',
                                        })
                                    })
                                })                            
                            })

                    })
            })

    }
};

</script>

<style></style>