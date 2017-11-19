<template>
  <ul class="demo-list-icon mdl-list">
    <component :is="currentItem(result)" v-for="result in results" :item="result" :draggable="draggable" :key="result.id" @itemClicked="itemClicked"></component>
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
  props: ['results', 'draggable'], 
  methods: {
    currentItem: function(item){
      if(item.type == "tag"){
        return "tag-item"
      }else{
        return "program-item"
      }
    },
    itemClicked: function(itm){
      this.$emit('itemClicked', itm)
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