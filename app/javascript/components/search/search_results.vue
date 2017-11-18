<template>
  <ul class="demo-list-icon mdl-list">
    <component :is="currentItem(result)" v-for="result in results" :item="result" :key="result.id"></component>
  </ul>
</template>

<script>

import ProgramItem from '../list_items/program.vue'
import TagItem from '../list_items/tag.vue'

export default {
  components: {
    'program-item': ProgramItem, 
    'tag-item': TagItem
  },
  props: ['results'], 
  methods: {
    currentItem: function(item){
      if(item.type == "program"){
        return "program-item"
      }else{
        return "tag-item"
      }
    }
  },
  data: function () {
    return {

    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>