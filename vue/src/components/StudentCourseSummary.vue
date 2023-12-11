<template>
    <div>
        <div v-for="element in curriculumElements" v-bind:key="element.courseId" class="box has-background-white-ter has-text-black">
            <h1 >{{ element.description }}</h1>
        </div>
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
    }
}
</script>
<style></style>