<template>
  <span class="mdl-chip" v-bind:class="{'mdl-chip--deletable': editable}" :data-event="eventPackage">
      <span class="mdl-chip__text">{{tag.name}}</span>
      <button v-if="editable" type="button" class="mdl-chip__action"><i class="material-icons">cancel</i></button>
  </span>
</template>

<script>

export default {
  props: ['tag', 'editable', 'draggable'], 
  methods: {

  },
  mounted: function(){
    if(this.draggable){
      $(this.$el).draggable({
        revert: true, 
        revertDuration: 0, 
        helper: 'clone',
      });      
    }
  },
  updated: function(){
    this.$el.dataset.event = this.eventPackage
  },
  computed: {
    eventPackage: function(){
      let data = Object.assign({}, {
        title:      this.tag.name,
        type:       'tag', 
        editable:   true, 
        className:  'tag-item',
        duration:   '00:30'
      })
      return JSON.stringify(data)
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