<template>
  <div class="demo-card-wide mdl-card mdl-shadow--2dp">
    <div class="mdl-card__title">
      <h2 class="mdl-card__title-text">{{item.title}}</h2>
      <span v-bind:title="exactDuration" class="card-duration">{{formattedDuration}}</span>
    </div>
    <div class="mdl-card__supporting-text">
      {{item.description}}
      <br /><br />
      <tag-cloud :tags="item.tags" :editable="false" :draggable="false" />
    </div>
    <div class="mdl-card__actions mdl-card--border">
      <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" v-on:click="edit">
        Edit
      </a>

      <a v-if="canPlay" class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" v-on:click="togglePlay">
        {{stateCopy}}
      </a>

      <button v-else disabled class="mdl-button loading mdl-button--colored mdl-js-button mdl-js-ripple-effect">
      </button>

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
    }, 
    stateCopy: function(){
      if(this.state == 0){
        return "Play"
      }else{
        return `Stop (${this.currentTime} / ${this.item.duration*60})`
      }
    }
  },
  mounted: function(){
    this.audioElement = new Audio(this.item.file_url); 
    $(this.audioElement).on('canplay', (ev) => {
      this.canPlay = true
    }).on('play', (ev) => {
      this.state = 1
    }).on('pause', (ev) => {
      this.state = 0
    }).on('timeupdate', (ev) => {
      this.currentTime = Math.floor(this.audioElement.currentTime)
    })
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
    togglePlay: function(){
      if(this.state == 1){
        this.audioElement.pause();
        this.audioElement.currentTime = 0
      }else{
        this.audioElement.play()
      }
    }
  },
  data: function () {
    return {
      state:         0, 
      currentTime:   0, 
      duration:      0, 
      canPlay:       false
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
  .loading{
    background-image:url(/assets/loader.gif);
    background-position: center center;
    background-repeat: no-repeat;
  }
</style>