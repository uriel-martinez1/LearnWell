<template>
    <div id="app">
        <form class="box" @submit.prevent="createCurriculum">
            <h1 class="title is-4">Create a Curriculum</h1>
            <div class="field">
                <label class="label">Curriculum Name</label>
                <div class="control">
                    <input class="input is-success" v-model="curriculumName" type="text"
                        placeholder="Type the curriculum name here" id="curriculumName" name="curriculumName" required>
                </div>
            </div>

            <div class="field">
                <label class="label">Curriculum Description</label>
                <div class="control">
                    <textarea class="textarea" v-model="curriculumDescription"
                        placeholder="Type the description of the lesson here" id="curriculumDescription"
                        name="curriculumDescription" rows="2" cols="50" required> </textarea>
                </div>
            </div>

            <div class="field">
                <label class="label">Daily Instructions</label>
                <div class="control">
                    <textarea class="textarea" v-model="dailyInstructions" placeholder="Place typed lecture content here"
                        id="dailyInstructions" name="dailyInstructions" rows="10" cols="50" required> </textarea>
                </div>
            </div>
            <!--also option to upload lecture content instead of textarea-->
            <!-- <label class="label" for="filebutton-0"></label> -->
            <div class="file is-info is-boxed">
                <label class="file-label">
                    <input class="file-input" type="file" name="curriculumFile"
                        onchange="if (this.files.length > 0) document.getElementById('filename-filebutton-0').innerHTML = this.files[0].name;">
                    <span class="file-cta"> <!--  DANGER innerHTML! -->
                        <span class="file-icon">
                            <i class="fa fa-upload"></i>
                        </span>
                        <span class="file-label">
                            Choose a file…
                        </span>
                    </span>
                </label>
            </div>
            <!-- Buttons to upload and remove resource. Again, sponsored by Bulma -->
            <div class="field">
                <label class="label" for="doublebutton-0"></label>
                <div class="control">
                    <button id="doublebutton-0" name="doublebutton-0" class="button is-success">Upload resource</button>
                    <button id="doublebutton2-0" name="doublebutton2-0" class="button is-danger">Remove resource</button>
                </div>
            </div>
            <!-- Create an assignment with (I hope) radio buttons to select either form or assignment upload -->

            <div class="field">
                <label class="label" for="createAssignment">Create Assignment</label>
                <div class="control">
                    <label class="radio">
                        <input type="radio" name="answer" id="formAssignment">
                        Form
                    </label>
                    <label class="radio">
                        <input type="radio" name="answer" id="uploadAssignment">
                        Assignment Upload
                    </label>
                </div>

            </div>

            <div class="field">
                <div class="control">
                    <input class="input is-success" v-model="assignmentName" name="assignmentName" type="text"
                        placeholder="Assignment name" id="assignmentName" required>

                </div>
            </div>

            <div class="field">
                <div class="control">
                    <input class="input is-link" id="assignmentUrl" name="assignmentUrl" type="text"
                        placeholder="Paste assignment URL here">
                </div>
            </div>
            <!-- upload assignment || delete assignment buttons -->
            <div class="field">

                <div class="control">
                    <button id="uploadButton" name="uploadButton" class="button is-success">Upload assignment</button>
                    <button id="deleteButton" name="deleteButton" class="button is-danger">Delete assignment</button>
                </div>
            </div>

            <!-- another upload button to populate new fields for the teacher to add another assignment-->
            <div class="field">
                <label class="label" for="singlebutton-0"></label>
                <div class="control">
                    <button id="singlebutton-0" name="singlebutton-0" class="button is-primary">Add another upload</button>
                </div>
            </div>

            <!-- create curriculum || cancel (ENTIRE FORM CLEARS) buttons -->

            <div class="control">
                <button class="button is-link">Create Curriculum</button>
                <button class="button is-link is-outlined">Cancel</button>
            </div>


        </form>
       
        <div class="notification is-success is-light" v-if="isCurriculumCreated">
            <h2>Curriculum Created!</h2>
            <p><strong>Curriculum Name:</strong> {{ curriculumName }}</p>
            <p><strong>Curriculum Description:</strong> {{ curriculumDescription }}</p>
            <p><strong>Daily Instructions:</strong> {{ dailyInstructions }}</p>
            <p><strong>Assignment:</strong> {{ assignment }}</p>
        </div>
    </div>
</template>

<script>
export default {
    data() {
        return {

            curriculumName: "",
            curriculumDescription: "",
            dailyInstructions: "",
            assignment: "",
            isCurriculumCreated: false,
            isCurriculumActive: false,
        };

    },
    methods: {
        createCurriculum() {
            return this.curriculumName, this.curriculumDescription,
                this.dailyInstructions, this.assignment,
                this.isCurriculumCreated = true,
                this.isCurriculumActive = false;
        }


    }
}

</script> 