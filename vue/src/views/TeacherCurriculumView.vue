<template>
    <curriculum-element class="content" v-bind:curriculum="curriculum"></curriculum-element>
    
</template>

<script>
import CurriculumElement from '../components/CurriculumElement.vue';
import TeacherService from  '../services/TeacherService';


export default {
    components: {
        CurriculumElement,
    }, 
    data() {
        return {
            curriculum: {}
        }
    },

    created() {
        // curriculum element, sources, assignment, assignment_questions, questions
        TeacherService.getCurriculumElementById(this.$route.params.elementId)
        .then((response) => {
            this.curriculum = {
                ...response.data,
            }
            //we grab the sources
            TeacherService.getSourcesByCurriculumElementId(this.$route.params.elementId)
            .then((sourcesResponse) => {
                this.curriculum.sources = []
                sourcesResponse.data.forEach((source) => {
                    this.curriculum.sources.push({
                        ...source,
                        //sources: sourcesResponse.data
                    })
                })
            })
            TeacherService.getAssignmentByCurriculumId(this.curriculum.curriculumElementId)
            .then((assignmentsResponse) => {
                this.curriculum.assignments = []
                assignmentsResponse.data.forEach((assignment) => {
                    this.curriculum.assignments.push({
                        ...assignment,
                        //assignments: assignmentsResponse.data
                    })
                })
            })
        })
    }
}
</script>

<style >
.content{
    position: absolute;
    left: 200px;

}
</style>