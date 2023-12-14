<template>
    <nav class="breadcrumb is-medium is-centered" aria-label="breadcrumbs">
        <ul>
            <li><a href="#">Dashboard</a></li>
            <li><a href="#">{{ this.courseData.courseName }}</a></li>
            <li class="is-active"><a href="#" aria-current="page">{{ curriculum.description }}</a></li>
        </ul>
    </nav>

    <div class="box">
        <h1 class="is-size-1"><strong>{{ this.courseData.courseName }} </strong></h1>

        <div class="column is-one-quarter">
            <button class="button is-success" v-on:click="EditCourse(this.$store.state.user.userId, course.courseId)">Edit
                curriculum</button>
        </div>

        <div v-for="source in this.curriculum.sources" :key="source.sourceId">
            <div class="box has-background-link-light">
                <h2 class="title is-4">Lecture Content</h2>
                <p class="content">{{ curriculum.lectureContent }}</p>
                <div class="content">
                    <p><strong>Source URL:</strong></p>
                    <a :href="source.sourceUrl" target="_blank">{{ source.sourceUrl }}</a>
                </div>
            </div>
        </div>

        <br />

        <div class="card-content has-background-link-light">
            <div class="content">
                <table class="table is-hoverable is-fullwidth">
                    <h2 class="is-size-4">Assignments</h2>
                    <tbody>
                        <tr class="has-background-link-light" v-for="assignment in this.curriculum.assignments"
                            :key="assignment.assignmentId">
                            <td class="has-text has-background-primary-light">{{ assignment.title }}</td>
                            <td class="has-text">{{ assignment.description }}</td>
                            <td class="has-text">{{ assignment.createdDate.split("T")[0] }}</td>
                            <td style="text-align: right; text-transform: capitalize;">
                                <span class="tag is-light" :class="{
                                    'is-link': assignment.assignmentType === 'homework',
                                    'is-primary': assignment.assignmentType === 'quiz',
                                    'has-background-info-light': assignment.assignmentType === 'essay'
                                }">{{ assignment.assignmentType }}
                                </span>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</template>

<script>
import TeacherService from '../services/TeacherService';


export default {
    props: {
        curriculum: {
            type: Object,
            default() {
                return {};
            },
        },
        courseData: {
            type: Object,
            default() {
                return {};
            },
        },

    },
    methods: {
        backToDashboard(userId)
        {
            this.$router.push({ name: 'Dashboard', params: { 'id': userId,}})
        },
    }

    //     TeacherService.getCurriculumElementById(this.elementId)
    //         .then((response) => {
    //             this.content.curriculum = response.data;
    //         })
    //         // lets grab assignments based on curriculum id 
    //         TeacherService.getAssignmentByCurriculumId(this.$route.params.curriculumId)
    //         .then((response) => {
    //             this.content.curriculum.assignments = response.data;
    //         })
    // }
    }  

</script>

<style></style>