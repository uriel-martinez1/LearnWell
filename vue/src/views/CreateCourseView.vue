
<template>
    <div id="app">
        <div class="sidebar">
            <side-bar-teacher-dashboard></side-bar-teacher-dashboard> 
        </div>
        <form @submit.prevent="createCourse">
            <label for="courseName">Course Name</label>
            <input v-model="courseName" type="text" placeholder="Type the name of the course here" id="courseName"
                name="courseName" required>

            <label for="difficulty">Difficulty</label>
            <select v-model="difficulty" id="difficulty" name="difficulty" required>
                <option value="beginner">Beginner</option> <!--if this is an int in our db? -->
                <option value="intermediate">Intermediate</option>
                <option value="advanced">Advanced</option>
            </select>

            <label for="cost">Cost</label>
            <select v-model="cost" id="cost" name="cost" required>
                <option value="free">0.00</option>
            </select>

            <label for="courseDescription">Course Description</label>
            <textarea v-model="courseDescription" placeholder="Type the description of the course here"
                id="courseDescription" name="courseDescription" rows="10" cols="50" required> </textarea>

            <input type="submit" value="Create Course">

        </form>

        <div v-if="isCourseCreated">
            <h2>Course Created!</h2>
            <p><strong>Course Name:</strong> {{ courseName }}</p>
            <p><strong>Difficulty:</strong> {{ difficulty }}</p>
            <p><strong>Cost:</strong> {{ cost }}</p>
            <p><strong>Course Description:</strong> {{ courseDescription }}</p>
        </div>
    </div>
</template>

<script>
import SideBarTeacherDashboard from '../components/Teacher/SideBarTeacherDashboard.vue'

export default {
    components:{
        SideBarTeacherDashboard
    },
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
                this.isCourseActive = true;
        }
    }
}
</script>