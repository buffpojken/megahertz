<template>
  <div class="demo-card-wide mdl-card mdl-shadow--2dp">
    <div class="mdl-card__title">
      <h2 class="mdl-card__title-text">{{item.title}}</h2>
      <span v-bind:title="exactDuration" class="card-duration">{{formattedDuration}}</span>
    </div>
    <div class="mdl-card__supporting-text">
      {{item.description}}
      <br /><br />
      <tag-cloud :tags="item.tags" :editable="false" />
    </div>
    <div class="mdl-card__actions mdl-card--border">
      <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" v-on:click="play">
        Listen
      </a>
      <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" v-on:click="edit">
        Edit
      </a>
    </div>
    <div class="mdl-card__menu">
      <button class="mdl-button mdl-button--icon mdl-js-button mdl-js-ripple-effect" v-on:click="close">
        <i class="material-icons">close</i>
      </button>
    </div>
  </div>
</template>

<script>

import TagCloud from '../tags/tag_cloud.vue'

export default {
  props: ['item'], 
  components: {
    'tag-cloud': TagCloud
  },
  computed: {
    formattedDuration: function(){
      return moment.duration(this.item.duration, 'minutes').humanize()
    }, 
    exactDuration: function(){
      return `${this.item.duration} minuter`
    }
  },
  methods: {
    edit: function(){
      document.querySelector('#snackbar-container').MaterialSnackbar.showSnackbar({
        message: "Not implemented."
      });
    },
    close: function(){
      this.$emit('closeCard')
    }, 
    play: function(){
      var audio = new Audio(this.item.file_url);
      audio.play();
    }
  },
  data: function () {
    return {

    }
  }
}
</script>

<style scoped>
  .demo-card-wide{
    width:100%;
    min-height: 0px;
  }
  .card-duration{
    display: inline-block;
    margin-left:20px;
    font-size:13px;
    color:rgba(0,0,0,0.8);
  }
</style>