<template>
    <div>
      <tag-item v-for="tag in tags" :tag="tag" :draggable="draggable" :editable="editable" />
    </div>
</template>

<script>

import TagItem from './tag_item.vue'

export default {
  props: ['tags', 'editable', 'draggable'], 
  components: {
    'tag-item': TagItem
  },
  methods: {

  },
  data: function () {
    return {

    }
  }
}
</script>

<style scoped>
  .mdl-chip{
    margin-right:5px;
  }
</style>