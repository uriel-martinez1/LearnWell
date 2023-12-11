<template>
  <div>{{ this.content }}</div>
  <form class="box" @submit.prevent="createCurriculum">
    <h1 class="title is-4">Create a Curriculum Element</h1>
    <div class="field">
      <label class="label">Description</label>
      <div class="control">
        <input class="input is-success" v-model="curriculumData.description" type="text" id="curriculumName"
          name="curriculumName" required />
      </div>
    </div>
    <!-- This is for curriculum content -->
    <div class="field">
      <label class="label">Lecture Content</label>
      <div class="control">
        <textarea class="textarea" v-model="curriculumData.lectureContent" placeholder="Place typed lecture content here"
          id="dailyInstructions" name="dailyInstructions" rows="10" cols="50" required>
            </textarea>
      </div>
    </div>
    <!--also option to upload lecture content instead of textarea-->
    <!-- <label class="label" for="filebutton-0"></label> -->

    <!-- THIS IS THE LOOP THAT DISPLAYS ALL THE SOURCES FOR THE CURRENT CURRICULUM ELEMENT -->
    <div class="field" v-for="(source, index) in this.curriculumData.sources" v-bind:key="source.sourceId">
      <label class="label">Resources</label>
      <div class="control">
        <input class="input is-success" v-model="source.content" type="text" id="curriculumName" name="curriculumName"
          required />
      </div>
      <!-- Button to remove an individual resource element from the source array buy the index point in the v-for above -->
      <button v-on:click="removeSourceElement(index)" id="doublebutton2-0" name="doublebutton2-0"
        class="button is-danger">
        Remove resource
      </button>
    </div>

    <!-- Button to add an empty resource element to the source array in the data object -->
    <div class="field">
      <label class="label" for="doublebutton-0"></label>
      <div class="control">
        <button v-on:click="addResourceElement" id="doublebutton-0" name="doublebutton-0" class="button is-success">
          Add Another Resource
        </button>
      </div>
    </div>

    <!-- THIS IS THE LOOP THAT DISPLAYS ALL THE ASSIGNMENTS -->
    <div id="assignment" v-for="(assignment, i) in curriculumData.assignments" v-bind:key="i">
      <!-- Create an assignment with (I hope) radio buttons to select either form or assignment upload -->
      <div class="field">
        <label class="label" for="createAssignment">Create Assignment</label>
        <div class="control">
          <label class="radio"> Form </label>
          <input type="radio" v-bind:name="i" id="formAssignment" v-model="assignment.assignmentUpload"
            v-bind:value="true" />
          <label class="radio"> Assignment Upload </label>
          <input type="radio" v-bind:name="i" id="uploadAssignment" v-model="assignment.assignmentUpload"
            v-bind:value="false" />
        </div>
      </div>
      <div class="assignment" v-if="assignment.assignmentUpload">
        <div class="field">
          <div class="control">
            <input class="input is-success" v-model="assignment_title" name="assignment_title" type="text"
              placeholder="Assignment Title" id="assignmentName" required />
          </div>
        </div>

        <div class="field" v-for="(question, j) in assignment.questions" v-bind:key="question.questionId">
          <div class="control">
            <input class="input is-success" v-model="question.prompt" name="curriculum_questions" type="text"
              placeholder="Add question here." id="assignmentName" required />
          </div>
          <button v-on:click="removeQuestionElement(i, j)" id="doublebutton2-0" name="doublebutton2-0"
            class="button is-danger">
            Remove Question
          </button>
        </div>

        <!-- Button to add an empty question element to the questions array in our state -->
        <div class="field">
          <label class="label" for="doublebutton-0"></label>
          <div class="control">
            <button v-on:click="addQuestionElement(i)" id="doublebutton-0" name="doublebutton-0"
              class="button is-success">
              Add Another Question
            </button>
          </div>
        </div>
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
      </div>
      <div class="field">
        <label class="label" for="doublebutton-0"></label>
        <div class="control">
          <button v-on:click="removeAssignmentElement(i)" id="doublebutton-0" name="doublebutton-0"
            class="button is-success">
            Remove Assignment
          </button>
        </div>
      </div>
      <button v-on:click="removeQuestionElement(index)" id="doublebutton2-0" name="doublebutton2-0"
        class="button is-danger">
        Remove Question
      </button>
    </div>

    <!-- BUTTON TO ADD AN ASSIGNMENT TO THE ARRAY OF ASSIGNMENTS IN STATE -->
    <div class="field">
      <label class="label" for="doublebutton-0"></label>
      <div class="control">
        <button v-on:click="addAssignmentElement" id="doublebutton-0" name="doublebutton-0" class="button is-success">
          Add Another Assignment
        </button>
      </div>
    </div>
  </form>
</template>

<script>
export default {
  props: {
    content: {
      type: Object,
      default() { return {} }
    }
  },
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
      },
    };
  },
  methods: {
    addAssignmentElement() {
      this.curriculumData.assignments.push({
        assignmentId: 0,
        assignmentType: "homework",
        createdDate: null,
        curriculumElementId: 0,
        description: "",
        lastUpdated: null,
        questions: [],
        title: "",
        assignmentUpload: true,
      });
    },
    removeAssignmentElement(index) {
      this.curriculumData.assignments.splice(index, 1);
    },
    removeSourceElement(index) {
      this.curriculumData.sources.splice(index, 1);
    },
    addResourceElement() {
      this.curriculumData.sources.push({ content: "" });
    },
    removeQuestionElement(i, j) {
      this.curriculumData.assignments[i].questions.splice(j, 1);
    },
    addQuestionElement(i) {
      this.curriculumData.assignments[i].questions.push({
        answer1: null,
        answer2: null,
        answer3: null,
        answer4: null,
        correctChoiceAnswer: null,
        createdDate: null,
        lastUpdated: null,
        prompt: "",
        questionId: 0,
        questionType: "text",
      });
    },
    toggleButton() {
      this.formOrAssignmentUpload = false;

    },
  },
};
</script>
