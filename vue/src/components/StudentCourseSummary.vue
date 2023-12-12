<template>
    <div v-if="curriculumElements[0] != undefined">
        <ul v-for="element in curriculumElements" v-bind:key="element.courseId" class="box has-background-white-ter has-text-black">
            <li v-on:click="goToCurriculumElement(curriculumElement.curriculumElementId)">{{ element.description }}</li>
        </ul>
    </div>
</template>

<script>
import StudentService from '../services/StudentService';

export default {
    data() {
        return {
            curriculumElements: null
        }
    },
    created() {
        StudentService.getCurriculumByCourseId(this.$route.params.courseId)
            .then((curriculumResponse) => {
                this.curriculumElements = curriculumResponse.data
                console.log(this.curriculumElements)
            })
    },
    method() {
        this.$router.push({name: 'StudentAssignmentSummaryView', params: {'curriculumElementId': curriculumElementId}})
    },
}
</script>
<style></style>