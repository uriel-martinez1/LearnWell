<template>
<!--We need to grad the student information based on the course?-->
<h1>Student Profile</h1>
<h2>{{ student.firstName }} {{ student.lastName }}</h2>

<!--First we need to grab the curriculum data-->

<!--Next we need t grab the assignments-->

<!--Then we grab their submitted assignments-->

</template>

<script>
import TeacherService from '../services/TeacherService';
import StudentService from '../services/StudentService';

export default{
    components: {
        
    },
    data() {
        return {
            student: []
        };
    },
    created() {
        StudentService.getStudentData(this.$route.params.userId)
        .then((response) => {
            this.student = response.data
        })
    }
}
</script>

<style>
</style>