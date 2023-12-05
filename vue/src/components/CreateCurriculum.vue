<template>
    <div id="app">
        <form @submit.prevent="createCurriculum">
            <label for="curriculumName">Curriculum Name</label>
            <input v-model="curriculumName" type="text" placeholder="Type the curriculum name here" id="curriculumName"
                name="curriculumName" required>

                <label for="curriculumDescription">Curriculum Description</label>
            <textarea v-model="curriculumDescription" placeholder="Type the description of the lesson here"
                id="curriculumDescription" name="curriculumDescription" rows="2" cols="50" required> </textarea>


            <label for="dailyInstructions">Daily Instructions</label>
            <textarea v-model="dailyInstructions" placeholder="Place typed lecture content here"
                id="dailyInstructions" name="dailyInstructions" rows="5" cols="50" required> </textarea>

            <!--also option to upload lecture content instead of textarea-->
            <label class="label" for="filebutton-0"></label>
            <div class="file">
                <label class="file-label">
                    <input class="file-input" type="file" name="filebutton-0"
                        onchange="if (this.files.length > 0) document.getElementById('filename-filebutton-0').innerHTML = this.files[0].name;">
                    <span class="file-cta">                                                                   <!--  DANGER innerHTML! -->
                        <span class="file-icon">
                            <i class="fa fa-upload"></i>
                        </span>
                        <span class="file-label" id="filename-filebutton-0">
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
                <label class="label" for="multipleradios-0">Create Assignment</label>
                <div class="control">
                    <label class="radio" for="multipleradios-0-0">
                        <input type="radio" name="multipleradios-0" id="multipleradios-0-0" value="Form" checked="checked">
                        Form
                    </label>
                    <label class="radio" for="multipleradios-0-1">
                        <input type="radio" name="multipleradios-0" id="multipleradios-0-1" value="Assignment upload">
                        Assignment upload
                    </label>
                </div>
            </div>

            <div class="field">
                <label class="label" for="textinput-1"></label>
                <div class="control">
                    <input id="textinput-1" name="textinput-1" type="text" placeholder="Assignment name" class="input "
                        required="">

                </div>
            </div>

            <div class="field">
                <label class="label" for="textinput-2"></label>
                <div class="control">
                    <input id="textinput-2" name="textinput-2" type="text" placeholder="Paste assignment URL here"
                        class="input ">

                </div>
            </div>
            <!-- upload assignment || delete assignment buttons -->
            <div class="field">
                <label class="label" for="doublebutton-1"></label>
                <div class="control">
                    <button id="doublebutton-1" name="doublebutton-1" class="button is-success">Upload assignment</button>
                    <button id="doublebutton2-1" name="doublebutton2-1" class="button is-danger">Delete assignment</button>
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
            <div class="field">
                <label class="label" for="doublebutton-3"></label>
                <div class="control">
                    <button id="doublebutton-3" name="doublebutton-3" class="button is-success">Create curriculum</button>
                    <button id="doublebutton2-3" name="doublebutton2-3" class="button is-danger">Cancel</button>
                </div>
            </div>
            
        </form>

        <div v-if="isCurriculumCreated">
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
                this.isCurriculumActive = true;
        }


    }
}

</script> 