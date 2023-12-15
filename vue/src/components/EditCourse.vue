
<template>
    <div id="app">
        <form class="box" @submit.prevent="editCourse">

            <h1 class="title is-4">Edit Course</h1>
            <div class="field">
                <label class="label">Course Name</label>
                <div class="control">
                    <input class="input is-success" v-model="courseName" type="text" placeholder="Type the name of the course here"
                        id="courseName" name="courseName">
                </div>
            </div>

            <div class="field">
                <label class="label">Difficulty</label>
                <div class="control">
                    <div class="select">
                        <select v-model="difficulty" id="difficulty" name="difficulty">
                            <option>Beginner</option>
                            <option>Intermediate</option>
                            <option>Advanced</option>
                        </select>
                    </div>
                </div>
            </div>

            <div class="field">
                <label class="label">Cost</label>
                <div class="control">
                    <div class="select">
                        <select v-model="cost" id="cost" name="cost">
                            <option>0.00</option>
                            <option>Free</option>
                        </select>
                    </div>
                </div>
            </div>

            <div class="field">
                <label class="label">Course Description</label>
                <div class="control">
                    <textarea class="textarea" v-model="courseDescription"
                        placeholder="Type the description of the course here" id="courseDescription"
                        name="courseDescription" rows="10" cols="50"></textarea>
                </div>
            </div>
            <div class="control">
                <button class="button is-link">Edit Course</button>
            </div>
        </form>

        <div class="notification is-success is-light" v-if="isCourseEdited">
            <h2>Course Edits Saved!</h2>
            <p><strong>Course Name:</strong> {{ courseName }}</p>
            <p><strong>Difficulty:</strong> {{ difficulty }}</p>
            <p><strong>Cost:</strong> {{ cost }}</p>
            <p><strong>Course Description:</strong> {{ courseDescription }}</p>
        </div>
    </div>
</template>

<script>
export default {
    data() {
        return {

            courseName: "",
            difficulty: "",
            cost: "free",
            courseDescription: "",
            isCourseCreated: false,
            isCourseActive: false,
        };

    },
    methods: {
        createCourse() {
            return this.courseName, this.difficulty, this.cost, this.courseDescription,
                this.isCourseCreated = true,
                this.isCourseActive = false;
        }
    }
}
</script>

<style> 
.form-input-group {
  margin-bottom: 1rem;
}

label {
  margin-right: 0.5rem;
}

.field {
  padding: 10px;
}

</style>