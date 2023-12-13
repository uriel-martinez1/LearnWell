<template>
    <!--We need to grad the student information based on the course?-->
    <div class="box has-background-white-ter">
        
        <section class="studentProfile">
            <h1 class="title is-5 has-text-centered has-text-black">Student Profile</h1>
        </section>
        <div class="columns">
            <div class="column is-two-thirds">
                <h2>
                    <span class="icon is-small">
                        <i class="fas fa-user"></i>
                    </span>
                    {{ student.firstName }} {{ student.lastName }}
                </h2>
                <p>
                    <span class="icon is-small">
                        <i class="fas fa-envelope"></i>
                    </span>
                    {{ student.email }}
                </p>
                <progress class="progress is-success" value="60" max="100">60%</progress>
            </div>
            <div class="column is-one-third has-text-centered">
                <!-- Add your image source dynamically or use a placeholder -->
                <img src="https://bulma.io/images/placeholders/128x128.png" alt="Profile" class="square-image">
            </div>
        </div>
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