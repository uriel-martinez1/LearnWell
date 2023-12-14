<template>
    <!-- Add a button thats accessible only to the teacher (v-if user.role === teacher), to toggle editing on the curriculum element, otherwise it will be in the view only format -->
    <div>
        <!-- v-if to toggle the view vs the edit curriculum element -->
        <!-- VIEW ONLY -->
        <!-- Editable version ==> multiple inputs/rich text areas within a form -->
        <!-- save button to save changes to the curriculum element ==> this will be our submit for the form -->
        <!-- when you submit we call the editCurriculum endpoint on the server and pass it the new curriculum element -->
        <!-- after you click the submit button we re-render the curriculum element view -->
        <div class="ShowCurriculumView" v-if="show">
        </div>

    </div>
    <div class="tile is-ancestor">
        <div class="tile is-vertical is-8">
            <div class="tile">
                <div class="tile is-parent is-vertical">
                    <article class="tile is-child notification is-success">
                        <p class="title">{{ this.curriculum.description }}</p>
                        <br/>
                        <p class="subtitle">{{ this.curriculum.lectureContent }}</p>
                        <!--This is for the sources-->
                        <table>
                            <thead>
                                <tr>
                                    <th class="has-text-white">Sources</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="source in this.curriculum.sources" :key="source.sourceId">
                                    <td>{{ source.sourceUrl }}</td>
                                </tr>
                            </tbody>
                        </table>
                        <br/>
                        <table class="table has-background-success">
                            <thead>
                                <tr>
                                    <th class="has-text-white">Title</th>
                                    <th class="has-text-white">Description</th>
                                    <th class="has-text-white">Created Date</th>
                                    <th class="has-text-white">Type</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="assignment in this.curriculum.assignments" :key="assignment.assignmentId">
                                    <td class="has-text-white">{{ assignment.title }}</td>
                                    <td class="has-text-white">{{ assignment.description }}</td>
                                    <td class="has-text-white">{{ assignment.createdDate }}</td>
                                    <td class="has-text-white">{{ assignment.assignmentType }}</td>
                                </tr>
                            </tbody>
                        </table>

                    </article>


                    <!-- <article class="tile is-child notification is-warning">
          <p class="title">{{ this.content.description }}</p>
          <p class="subtitle">{{this.content.lectureContent}}</p>
        </article> -->
                </div>

            </div>
        </div>
        <!-- <div class="tile is-parent">
    <article class="tile is-child notification is-success">
      <div class="content">
        <p class="title">{{ this.content.description }} *Tall tile*</p>
        <p class="subtitle">{{this.content.lectureContent}}</p>
        <div class="content">
        </div>
      </div>
    </article>
  </div> -->
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
        }
    },
    data() {
        return {
            newContent: {
                ...this.curriculum
            },
        }
    },
    // created() {
    //     //order of grab info -- course, curriculum, sources, assignments, 
    //     TeacherService.getCourseByCourseId(this.elementId)
    //     .then((response)=> {
    //         this.content = response.data;
    //     })
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