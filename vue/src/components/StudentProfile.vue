<template>
    <!--We need to grad the student information based on the course?-->
    <div class="box has-background-white-ter">
        <section class="studentProfile">
            <h1 class="title is-5 has-text-centered has-text-black">Student Profile</h1>
        </section>
        <h2>{{ student.firstName }} {{ student.lastName }}</h2>
        <p>{{ student.email }}</p>
    </div>

    <!--First we need to grab the curriculum data-->

    <!--Next we need t grab the assignments-->

    <!--Then we grab their submitted assignments-->
</template>

<script>
import TeacherService from '../services/TeacherService';
import StudentService from '../services/StudentService';

export default {
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

<style >
.studentProfile {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 30px;
    padding-top: 30px;
}

.content {
    position: relative;
    left: 0px;
}
</style>