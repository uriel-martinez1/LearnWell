<template>
    <h1>Assignment List</h1>
    <ul>
        <li v-for="course in $store.state.user.courses" v-bind:key="course.courseid">{{ course.courseName }}</li>
        <li>{{ course.students }}</li>
    </ul>

</template>

<script>
export default {
    computed: {
        course() {
            return this.$store.state.user.courses.filter((course) => {
                return course.courseName === true;
            });
        },
        studentCount() {
            return this.$store.state.user.courses.students.reduce((totalCount) => {
                return totalCount += 1;
            }, 0);
        }
    }
}
</script>