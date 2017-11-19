<template>
    <li class="mdl-list__item" :data-event="eventPackage" v-on:click="itemClicked(item)">
      <span class="mdl-list__item-primary-content">
      <i class="material-icons mdl-list__item-icon">person</i>
      {{item.title}}
  </span>
    </li>
</template>

<script>

export default {
  props: ['item', 'draggable'], 
  mounted: function(){
    if(this.draggable){
      $(this.$el).draggable({
        revert: true, 
        revertDuration: 0, 
        helper: 'clone',
        stop: function(event, ui){
          console.log(ui.helper)
        }
      });
    }
  },
  updated: function(){
    this.$el.dataset.event = this.eventPackage
  },
  methods: {
    itemClicked: function(itm){
      this.$emit('itemClicked', itm)
    }
  },
  computed: {
    eventPackage: function(){
      let data = Object.assign({}, {
        title: this.item.title, 
        id:   this.item.id,
        duration: this.item.duration, 
        className: 'program-item'
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