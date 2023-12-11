
<template>
    <div>
        <h1>Add New Course</h1>
        <create-course> </create-course>
    </div>
</template>

<script>
import createCourse from '../components/CreateCourse.vue'

export default {
    components: {
        createCourse,
    },
    data() {
        return {
            course: {
                id: 0,
                teacherId: parseInt(this.$route.params.userId),
                name: '',
                description: '',
                difficulty: 0,
                cost: 0,
                created: new Date(),
                updated: new Date(),
                active: 1,
            }
        }
    },
};
</script>

<style></style>