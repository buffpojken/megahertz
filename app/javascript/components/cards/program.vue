<template>
  <div class="demo-card-wide mdl-card mdl-shadow--2dp">
    <div class="mdl-card__title">
      <h2 class="mdl-card__title-text">{{item.title}}</h2>
    </div>
    <div class="mdl-card__supporting-text">
      {{item.description}}
    </div>
    <div class="mdl-card__actions mdl-card--border">
      <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" v-on:click="play">
        Listen
      </a>
      <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
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

export default {
  props: ['item'], 
  methods: {
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
</style>