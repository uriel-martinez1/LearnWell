<template>
    <nav class="breadcrumb is-medium is-centered" aria-label="breadcrumbs">
        <ul>
            <li><a v-on:click="backToDashboard">Dashboard</a></li>
            <li class="is-active"><a href="#" aria-current="page">{{ student.firstName }} {{ student.lastName }}</a></li>
        </ul>
    </nav>
    <div class="box smallBox has-background-link-light">
        <section class="studentProfile">
            <h1 class="is-size-2"><strong>Student Profile</strong></h1>
        </section>
        
            <div class="columns">
                <div class="column is-one-third has-text-centered">
                    <!-- Add your image source dynamically or use a placeholder -->
                    <img src="../icon/icons8-username-96.png" alt="Profile" class="square-image">
                </div>
                <div class="column is-two-thirds has-text-centered">
                    <h2 class="is-size-2">
                        {{ student.firstName }} {{ student.lastName }}
                    </h2>
                    <p class="is-size-5">
                        <span class="icon is-small">
                            <i class="fas fa-envelope"></i>
                        </span>
                         {{ student.email }}
                    </p>
                    <!-- <progress class="progress is-link" value="60" max="100">60%</progress> -->
                </div>
            </div>
        
    </div>
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
    },
    methods: {
        backToDashboard() {
            this.$router.push({ name: 'TeacherDashboardView', params: { 'id': this.$store.state.user.userId } });
        }
    }
}
</script>

<style >
.smallBox {
    max-width: 60%;
    margin-left: 20%;

}

.studentProfile {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 30px;
    padding-top: 10px;
}


.content {
    position: relative;
    left: 0px;
}

.is-active:hover {
    cursor: default;
}
</style>