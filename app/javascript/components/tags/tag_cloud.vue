<template>
    <div>
      <tag-item v-for="tag in tags" :tag="tag" :editable="editable" />
    </div>
</template>

<script>

import TagItem from './tag_item.vue'

export default {
  props: ['tags', 'editable'], 
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