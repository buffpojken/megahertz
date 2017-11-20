<template>

  <section class="mdl-layout__tab-panel is-active">
    <div class="page-content">
        <div class="mdl-grid">
          <div class="mdl-cell mdl-cell--4-col mdl-cell--1-offset-desktop">
            <form action="#" v-on:submit.prevent="search">
              <div class="mdl-textfield mdl-js-textfield">
                <input class="mdl-textfield__input" v-model="query" placeholder="Search..." type="search">
                <label class="mdl-textfield__label" for="sample1">Search</label>
              </div>
            </form>
          </div>
        </div>

        <div class="mdl-grid">
          <div class="mdl-cell mdl-cell--4-col mdl-cell--1-offset-desktop">
            <search-results v-if="results.length > 0" :results="results" :draggable="false" @itemClicked="itemClicked"></search-results>
          </div>

          <div class="mdl-cell mdl-cell--6-col">
            <program-card :key="currentItem.id" :item="currentItem" @closeCard="closeCard" v-if="currentItem" />
          </div>

        </div>        
    </div>  
  </section>

</template>

<script>

import SearchResults from './search/search_results.vue'
import ProgramCard from './cards/program.vue'

export default {
  components: {
    'search-results': SearchResults, 
    'program-card': ProgramCard
  },
  methods: {
    itemClicked: function(item, ev){
      this.currentItem = item
    },
    closeCard: function(){
      this.currentItem = null
    },
    search: function(ev){
      let that = this
      $.ajax({
        url: '/search/list', 
        data: {query: this.query}, 
        dataType: 'json', 
        success: function(data){
          that.results = data.results
        }
      })

      console.log(this.query)
    }
  },
  data: function () {
    return {
      query:    "", 
      currentItem: null,
      results: []
    }
  }
}
</script>

<style scoped>
.mdl-textfield__input{
  outline: none;
}
</style>