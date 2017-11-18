<template>
    <li class="mdl-list__item" :data-event="eventPackage">
      <span class="mdl-list__item-primary-content">
      <i class="material-icons mdl-list__item-icon">person</i>
      {{item.title}}
  </span>
    </li>
</template>

<script>

export default {
  props: ['item'], 
  mounted: function(){
    $(this.$el).draggable({
      revert: true, 
      revertDuration: 0, 
      helper: 'clone',
      stop: function(event, ui){
        console.log(ui.helper)
      }
    });
  },
  updated: function(){
    this.$el.dataset.event = this.eventPackage
    console.log(this.$el.dataset)
  },
  computed: {
    eventPackage: function(){
      let data = Object.assign({}, {
        title: this.item.title, 
        duration: this.item.duration, 
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