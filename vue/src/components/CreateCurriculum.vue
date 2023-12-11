<template>
  <div>
    <div v-if="this.$route.query.action === 'edit'">
      <div>{{ this.content }}</div>
      <form class="box" @submit.prevent="createCurriculum">
        <h1 class="title is-4">Create a Curriculum</h1>
        <div class="field">
          <label class="label">Description</label>
          <div class="control">
            <input class="input is-success" v-model="curriculumData.description" type="text" id="curriculumName"
              name="curriculumName" required />
          </div>
        </div>

        <div class="field">
          <label class="label">Lecture Content</label>
          <div class="control">
            <textarea class="textarea" v-model="curriculumData.lectureContent"
              placeholder="Place typed lecture content here" id="dailyInstructions" name="dailyInstructions" rows="10"
              cols="50" required>
            </textarea>
          </div>
        </div>
        <!--also option to upload lecture content instead of textarea-->
        <!-- <label class="label" for="filebutton-0"></label> -->
        <div class="field" v-for="(source, index) in this.curriculumData.sources" v-bind:key="source.sourceId">
          <label class="label">Resources</label>
          <div class="control">
            <input class="input is-success" v-model="source.content" type="text" id="curriculumName" name="curriculumName"
              required />
          </div>
        </div>
        <!-- Buttons to upload and remove resource. Again, sponsored by Bulma -->
        <button v-on:click="removeSourceElement(index)" id="doublebutton2-0" name="doublebutton2-0"
          class="button is-danger">
          Remove resource
        </button>
        <!-- Create an assignment with (I hope) radio buttons to select either form or assignment upload -->
        <div class="field">
          <label class="label" for="doublebutton-0"></label>
          <div class="control">
            <button v-on:click="addResourceElement" id="doublebutton-0" name="doublebutton-0"
              class="button is-success">Add Another Resource</button>
          </div>
        </div>
        <div id="assignment" v-for="(assignment, index) in curriculumData.assignments" v-bind:key="index">

          <div class="field">
            <label class="label" for="createAssignment">Create Assignment</label>
            <div class="control">
              <label class="radio"> Form </label>
              <input type="radio" name="answer" id="uploadAssignment" v-model="assignmentUpload" v-bind:value="true" />
              <label class="radio">
                Assignment Upload
              </label>
              <input type="radio" name="answer" id="uploadAssignment" v-model="assignmentUpload" v-bind:value="false" />

            </div>
          </div>
        </div>
        <div class="assignment" v-if="this.assignmentUpload">
          <div class="field">
            <div class="control">
              <input class="input is-success" v-model="assignment_title" name="assignment_title" type="text"
                placeholder="Assignment Title" id="assignmentName" required />
            </div>
          </div>
        </div>
        <div class="field" v-for="(question, index) in this.curriculumData.questions" v-bind:key="question.questionId">
          <div class="control">
            <input class="input is-success" v-model="question.prompt" name="curriculum_questions" type="text"
              placeholder="Add question here." id="assignmentName" required />
          </div>
          <button v-on:click="removeQuestionElement(index)" id="doublebutton2-0" name="doublebutton2-0"
            class="button is-danger">
            Remove Question
          </button>
        </div>
        <div class="field">
          <label class="label" for="doublebutton-0"></label>
          <div class="control">
            <button v-on:click="addQuestionElement" id="doublebutton-0" name="doublebutton-0" class="button is-success">
              Add Another Question
            </button>
          </div>
        </div>
      </form>
    </div>
    <div class="field" v-else>
      <div class="control">
        <input class="input is-link" id="assignmentTitle" name="assignmentTitle" type="text"
          placeholder="Assignment Title" />
      </div>
      <div class="control">
        <input class="input is-link" id="assignmentUrl" name="assignmentUrl" type="text"
          placeholder="Paste assignment URL here" />
      </div>
      <div class="control">
        <button class="button is-link">Create Curriculum</button>
        <button class="button is-link is-outlined">Cancel</button>
      </div>
      <!-- </form> -->
    </div>
    <div v-else>
      <form class="box" @submit.prevent="createCurriculum">
        <h1 class="title is-4">Create a Curriculum</h1>
        <div class="field">
          <label class="label">Description</label>
          <div class="control">
            <input class="input is-success" v-model="description" type="text" placeholder="Type the curriculum name here"
              id="curriculumName" name="curriculumName" required />
          </div>
        </div>

        <div class="field">
          <label class="label">Lecture Content</label>
          <div class="control">
            <textarea class="textarea" v-model="lecture_content" placeholder="Type the description of the lesson here"
              id="curriculumDescription" name="curriculumDescription" rows="2" cols="50" required>
            </textarea>
          </div>
        </div>

        <div class="field">
          <label class="label">Daily Instructions</label>
          <div class="control">
            <textarea class="textarea" v-model="dailyInstructions" placeholder="Place typed lecture content here"
              id="dailyInstructions" name="dailyInstructions" rows="10" cols="50" required>
            </textarea>
          </div>
        </div>
        <!--also option to upload lecture content instead of textarea-->
        <!-- <label class="label" for="filebutton-0"></label> -->
        <div class="file is-info is-boxed">
          <label class="file-label">
            <input class="file-input" type="file" name="curriculumFile"
              onchange="if (this.files.length > 0) document.getElementById('filename-filebutton-0').innerHTML = this.files[0].name;" />
            <span class="file-cta">
              <!--  DANGER innerHTML! -->
              <span class="file-icon">
                <i class="fa fa-upload"></i>
              </span>
              <span class="file-label"> Choose a file… </span>
            </span>
          </label>
        </div>
        <!-- Buttons to upload and remove resource. Again, sponsored by Bulma -->
        <div class="field">
          <label class="label" for="doublebutton-0"></label>
          <div class="control">
            <button id="doublebutton-0" name="doublebutton-0" class="button is-success">
              Upload resource
            </button>
            <button id="doublebutton2-0" name="doublebutton2-0" class="button is-danger">
              Remove resource
            </button>
          </div>
        </div>

        <div v-for="assignment in this.assignments" v-bind:key="assignment.assignmentId">
          <!-- Create an assignment with (I hope) radio buttons to select either form or assignment upload -->

          <div class="field">
            <label class="label" for="createAssignment">Create Assignment</label>
            <div class="control">
              <label class="radio">
                <input type="radio" name="answer" id="formAssignment" />
                Form
              </label>
              <label class="radio">
                <input type="radio" name="answer" id="uploadAssignment" />
                Assignment Upload
              </label>
            </div>
          </div>

          <div class="field">
            <div class="control">
              <input class="input is-success" v-model="assignment.title" name="assignment_title" type="text"
                placeholder="Assignment name" id="assignmentName" required />
            </div>
          </div>

          <div class="field">
            <div class="control">
              <input class="input is-success" v-model="assignment.description" name="assignment_description" type="text"
                placeholder="Description" id="assignmentName" required />
            </div>
          </div>

          <div class="field">
            <div class="control">
              <input class="input is-link" v-model="assignment.description" id="assignmentUrl" name="assignmentUrl"
                type="text" placeholder="Paste assignment URL here" />
            </div>
          </div>
          <!-- upload assignment || delete assignment buttons -->
          <div class="field">
            <div class="control">
              <button id="uploadButton" name="uploadButton" class="button is-success">
                Upload assignment
              </button>
              <button id="deleteButton" name="deleteButton" class="button is-danger">
                Delete assignment
              </button>
            </div>
          </div>
        </div>

        <!-- another upload button to populate new fields for the teacher to add another assignment-->
        <div class="field">
          <label class="label" for="singlebutton-0"></label>
          <div class="control">
            <button id="singlebutton-0" name="singlebutton-0" class="button is-primary">
              Add another upload
            </button>
          </div>
        </div>

        <!-- create curriculum || cancel (ENTIRE FORM CLEARS) buttons -->

        <div class="control">
          <button class="button is-link">Create Curriculum</button>
          <button class="button is-link is-outlined">Cancel</button>
        </div>
      </form>
    </div>

    <div class="notification is-success is-light" v-if="isCurriculumCreated">
      <h2>Curriculum Created!</h2>
      <p><strong>Curriculum Name:</strong> {{ curriculumName }}</p>
      <p>
        <strong>Curriculum Description:</strong> {{ curriculumDescription }}
      </p>
      <p><strong>Daily Instructions:</strong> {{ dailyInstructions }}</p>
      <p><strong>Assignment:</strong> {{ assignment }}</p>
    </div>
  </div>
</template>

<script>
export default {
  props: ["content"],
  data() {
    return {
      assignmentUpload: false,
      curriculumData: {
        curriculumElementId: this.content.curriculumElementId || 0,
        courseId: this.content.courseId || 0,
        courseOrder: this.content.courseOrder || 0,
        description: this.content.description || "",
        lectureContent: this.content.lectureContent || "",
        createdDate: this.content.createdDate || 0,
        lastUpdated: this.content.lastUpdated || 0,
        //push a source here when you click the button Add Source
        sources: this.content.sources || [
          { content: "blah.com" },
          { content: "blahblah.com" },
          { content: "blahblahblah.com" },

        ],
        //push an assignment here when you click the button Add Assignment
        assignments: this.content.assignments || [],
        //push a question here when you click the button Add Question
        questions: this.content.questions || [
          { prompt: "this is a question" },
          { prompt: "this is another question" },
          { prompt: "this is yet another question" },

        ],
      },
    };
  },
  created() { },
  // created(){
  //     this.curriculumData =
  // },
  methods: {
    removeSourceElement(index) {
      this.curriculumData.sources.splice(index, 1);
    },
    addResourceElement() {
      this.curriculumData.sources.push({ content: "" });
    },
    removeQuestionElement(index) {
      this.curriculumData.questions.splice(index, 1);
    },
    addQuestionElement() {
      this.curriculumData.questions.push({ prompt: "" });
    },

    createCurriculum() {
      // return this.curriculumName, this.curriculumDescription,
      //     this.dailyInstructions, this.assignment,
      //     this.isCurriculumCreated = true,
      //     this.isCurriculumActive = false;
      console.log(this.curriculumData);
    },
    toggleButton() {
      this.formOrAssignmentUpload = false;

    },
  },
};
</script>
