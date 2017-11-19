<template>

  <div class="mdl-layout mdl-js-layout mdl-layout--fixed-header" id="app">
    <header class="mdl-layout__header">
      <div class="mdl-layout__header-row">
        <!-- Title -->
        <span class="mdl-layout-title">Övning Skymningsläge - Megahertz</span>
      </div>
      <!-- Tabs -->
      <div class="mdl-layout__tab-bar mdl-js-ripple-effect mdl-layout__tab-manual-switch">
        <a href="#" v-on:click.stop="setView('tableau')" v-bind:class="{'is-active': currentView == 'tableau'}" class="mdl-layout__tab">Tablå</a>
        <a href="#" v-on:click.stop="setView('database')" v-bind:class="{'is-active': currentView == 'database'}"class="mdl-layout__tab">Databas</a>
        <a href="#" v-on:click.stop="setView('settings')" v-bind:class="{'is-active': currentView == 'settings'}"class="mdl-layout__tab">Inställningar</a>
      </div>
    </header>
    <div class="mdl-layout__drawer">
      <span class="mdl-layout-title">Title</span>
    </div>
    <main class="mdl-layout__content">
      <component :is="currentView"></component>
    </main>
    <div id="snackbar-container" class="mdl-js-snackbar mdl-snackbar">
      <div class="mdl-snackbar__text"></div>
      <button class="mdl-snackbar__action" type="button"></button>
    </div>
  </div>

</template>

<script>
import Tableau from '../components/tableau.vue'
import Database from '../components/database.vue'
import Settings from '../components/settings.vue'

export default {
  components: {
    tableau: Tableau, 
    database: Database, 
    settings: Settings
  },
  methods: {
    setView: function(key){
      this.currentView = key
    }
  },
  data: function () {
    return {
      message: "Hello Vue!", 
      currentView: 'tableau'
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
