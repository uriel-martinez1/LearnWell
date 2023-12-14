<template>
  <div v-if="curriculumElement != undefined">
    <div
      v-for="assignment in assignmentElements"
      v-bind:key="assignment.assignmentId"
      class="box has-background-white-ter has-text-black"
    >
      <lecture-details
        :curriculumElement="curriculumElement"
        :sources="sources"
      ></lecture-details>
      <assignment-details :assignment="assignment"></assignment-details>
    </div>
  </div>
</template>

<script>
import StudentService from "../services/StudentService";
import AssignmentDetails from "@/components/AssignmentDetails.vue";
import LectureDetails from "../components/LectureDetails.vue";

export default {
  components: {
    AssignmentDetails,
    LectureDetails,
  },
  data() {
    return {
      assignmentElements: [],
      curriculumElement: undefined,
      sources: [],
    };
  },
  created() {
    StudentService.getAssignmentsByCurriculumId(
      this.$route.params.curriculumElementId
    ).then((assignmentResponse) => {
      this.assignmentElements = assignmentResponse.data;
    });
    StudentService.getSourcesByCurriculumElementId(
      this.$route.params.curriculumElementId
    ).then((sourceResponse) => {
      this.sources = sourceResponse.data;
      console.log("SOURCES", this.sources)
    });
    StudentService.getCurriculumByCurriculumElementId(
      this.$route.params.curriculumElementId
    ).then((curriculumResponse) => {
      this.curriculumElement = curriculumResponse.data;
    });
  },
};
</script>
<style></style>
