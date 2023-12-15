<template>
    <div class="box">
        <br />
        <h1 class="title is-2 has-text-centered">Modules Section</h1>
        <div v-if="curriculumElements[0] != undefined">
            <ul v-for="element in curriculumElements" v-bind:key="element.courseId">
                <br />
                <div v-on:click="goToCurriculumElement(element.curriculumElementId)" class="box has-background-link-dark">
                    <li style="color: white; font-weight: 600;">{{ element.description }}</li>
                </div>
            </ul>
        </div>
    </div>
</template>

<script>
import StudentService from '../services/StudentService';

export default {
    data() {
        return {
            curriculumElements: []
        }
    },
    created() {
        StudentService.getCurriculumByCourseId(this.$route.params.courseId)
            .then((curriculumResponse) => {
                this.curriculumElements = curriculumResponse.data
                console.log(this.curriculumElements)
            })
    },
    methods: {
        goToCurriculumElement(curriculumElementId) {
            this.$router.push({ name: 'StudentAssignmentSummaryView', params: { courseId: this.$route.params.courseId, 'curriculumElementId': curriculumElementId } })
        }
        
    },
}
</script>
<style></style>