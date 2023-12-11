
<template>
    <div id="app">
        <form class="box" @submit.prevent="submitCourse">

            <h1 class="title is-4" v-if="this.$route.query.action=='edit'">Edit a Course</h1>
            <h1 class="title is-4" v-else>Create a Course</h1>
            <div class="field">
                <label class="label">Course Name</label>
                <div class="control">
                    <input class="input is-success" v-model="newCourse.name" type="text"
                        placeholder="Type the name of the course here" id="courseName" name="courseName">
                </div>
            </div>

            <div class="field">
                <label class="label">Difficulty</label>
                <div class="control">
                    <div class="select">
                        <!--Figure out the binding with the value-->
                        <select v-model="newCourse.difficulty" id="difficulty" name="difficulty">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                            <option value="10">10</option>
                        </select>
                    </div>
                </div>
            </div>

            <div class="field">
                <label class="label">Cost</label>
                <div class="control">
                    <strong>$ </strong><input v-model="newCourse.cost" type="number" min="0.00" step="1" max="0" />
                </div>
            </div>

            <div class="field">
                <label class="label">Course Description</label>
                <div class="control">
                    <textarea class="textarea" v-model="newCourse.description"
                        placeholder="Type the description of the course here" id="courseDescription"
                        name="courseDescription" rows="10" cols="50" ></textarea>
                </div>
            </div>

            <div class="control">
                <button class="button is-link" type="submit">Create Course</button>
                <button class="btn btn-cancel" v-on:click="cancelForm" type="button">Cancel</button>
            </div>
        </form>

        <!-- <div v-if="isCourseCreated">
            <h2>Course Created!</h2>
            <p><strong>Course Name:</strong> {{ courseName }}</p>
            <p><strong>Difficulty:</strong> {{ difficulty }}</p>
            <p><strong>Cost:</strong> {{ cost }}</p>
            <p><strong>Course Description:</strong> {{ courseDescription }}</p>
        </div> -->
    </div>
</template>

<script>
// this is the location of the put method for adding a new course --> addCourseByTeacherId(id, course) 
import TeacherService from '../services/TeacherService';

export default {
    // Specifying a prop for a course object?
    props: {
        course: {
            type: Object,
            default() { return {} }
        }
    }, data() {
        return {
            newCourse: {
                // Unsure about the naming and structure of object
                id: this.course.courseId || 0,
                // trying to grab the id of the teacher from the url
                teacherId: this.course.teacherId || parseInt(this.$store.state.userId),
                name: this.course.courseName || '',
                description: this.course.description || '',
                difficulty: this.course.difficulty || 0,
                cost: this.course.cost || 0,
                //WHEN WE CREATE A NEW COURSE THIS WILL BE CREATED BY THE DB, DONT PASS THIS IN THE DTO FROM FRONT TO BACK?
                created: this.course.createdDate || null,
                // unsure about the updated section
                updated: this.course.lastUpdated || new Date(),
            }
        };

    },
    methods: {
        // createCourse() {
        //     return this.courseName, this.difficulty, this.cost, this.courseDescription,
        //         this.isCourseCreated = true,
        //         this.isCourseActive = false;
        // }
        submitCourse() {
            // validate the form
            if (!this.validateForm()) {
                return;
            }

            if (this.newCourse.id === 0) {
                //create the new course
                TeacherService.addCourseByTeacherId(this.$route.params.userId, this.newCourse)
                    .then((response) => {
                        //HARD CODED STATUS RESPONSE CHECK, VERIFY 201 SENT ON BACKEND
                        if (response.status === 201) {
                            this.$store.commit('SET_NOTIFICATION',
                                {
                                    message: 'A new course was added.',
                                    type: 'success'
                                });
                            // unsure about this router push
                            this.$router.push({ name: 'TeacherDashboardView', params: { id: this.$route.params.userId } });
                        }
                    })
                    .catch((error) => {
                        this.handleErrorResponse(error, 'adding');
                    });
            } else {
                TeacherService.updateCourseFormByTeacherId(this.$route.params.userId, this.newCourse)
                    .then((response) => {
                        //HARD CODED STATUS RESPONSE CHECK, VERIFY 200 SENT ON BACKEND
                        if (response.status === 200) {
                            this.$store.commit('SET_NOTIFICATION', {
                                message: `Course ${this.newCourse.id} was updated.`,
                                type: 'success'
                            });
                            this.$router.push({ name: 'TeacherDashboardView', params: { id: this.$route.params.userId } });
                        }
                    })
                    .catch((error) => {
                        this.handleErrorResponse(error, 'updating');
                    });
            }
        },
        cancelForm() {
            this.$router.push({ name: 'TeacherDashboardView', params: { id: this.$route.params.userId } });
        },
        handleErrorResponse(error, verb) {
            // we could reach the server but there was a problem with the request
            if (error.response) {
                this.$store.commit('SET_NOTIFICATION',
                    "Error " + verb + " course. Response received was '" + error.response.statusText + "'.");
            } else if (error.request) {
                // this lets us know if we could not reach the server
                this.$store.commit('SET_NOTIFICATION', "Error " + verb + " course. Server could not be reached.");
            } else {
                this.$store.commit('SET_NOTIFICATION', "Error " + verb + " course. Request could not be created.");
            }
        },
        validateForm() {
            let msg = '';
            if (this.newCourse.name.length === 0) {
                msg += 'The new course must have a name.';
            }
            if (this.newCourse.difficulty === 0) {
                msg += 'The new course must have a difficulty rank.';
            }
            if (this.newCourse.description.length === 0) {
                msg += 'The new course must have a description.';
            }
            if (msg.length > 0) {
                this.$store.commit('SET_NOTIFICATION', msg);
                return false;
            }
            return true;
        }
    }
}
</script>

<style> .form-input-group {
     margin-bottom: 1rem;
 }

 label {
     margin-right: 0.5rem;
 }

 .field {
     padding: 10px;
 }

 .box {
     max-width: 50%;

     margin: 0 auto;
     background-color: #ffffff;
     padding: 20px;
     border-radius: 8px;
     box-shadow: 0 10px 8px rgba(107, 6, 154, 0.1);
 }
</style>














