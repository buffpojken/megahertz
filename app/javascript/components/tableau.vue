<template>
  <section class="mdl-layout__tab-panel is-active">
    <div class="page-content">
        <div class="mdl-grid">
          <div class="mdl-cell mdl-cell--4-col mdl-cell--2-offset-desktop">

            <form action="#">
              <div class="mdl-textfield mdl-js-textfield">
                <input class="mdl-textfield__input" placeholder="Search..." v-on:input="performSearch" type="search">
                <label class="mdl-textfield__label" for="sample1">Search</label>
              </div>
            </form>

            <search-results v-if="searchResults.length > 0" :results="searchResults" :draggable="true" @itemClicked="searchResultClicked"></search-results>

            <h4 class="display-2">Tags</h4>
            <p>Drag these into the schedule to autofill that slot with items tagged with the used tag.</p>
            <tag-cloud :tags="tags" :draggable="true"></tag-cloud>
            <br /><br />
            <hr>
            <button v-if="transmitState == 0" @click="toggleTransmit" class="mdl-button mdl-js-button mdl-button--primary">
              Transmit
            </button>  
            <button v-if="transmitState == 1" @click="toggleTransmit" class="mdl-button mdl-js-button mdl-button--primary">
              Stop 
            </button>       
          </div>
          <div class="mdl-cell mdl-cell--4-col">
            <div id="calendar-1"></div>
          </div>
        </div>
    </div>
  </section>
</template>

<script>

import SearchResults from './search/search_results.vue'
import TagCloud from './tags/tag_cloud.vue'

export default {
  data: function () {
    return {
      transmitState: 0,
      searchResults: [], 
      tags: [{name:"skymningsläge"}, {name:"gryningsläge"}, {name:"nyheter"}]
    }
  },
  components:{
    'search-results': SearchResults,
    'tag-cloud': TagCloud
  },
  methods: {
    toggleTransmit: function(){
      if(this.transmitState == 0){
        this.transmitState = 1
      }else{
        if(confirm('Är du säker?')){
          this.transmitState = 0
        }
      }
    },
    searchResultClicked: function(item){
      document.querySelector('#snackbar-container').MaterialSnackbar.showSnackbar({
        message: `Show metadata for ${item.title}`
      });
    },
    performSearch: function(ev){
      console.log(ev.target.value)
    },
    fetchProgram: function(id){
      $.ajax({
        url: `/programs/${id}`,
        dataType: 'json', 
        success: (data) => {
          this.searchResults = Array(data)
        }, 
        error: function(){

        }
      })
    }
  },
  mounted: function(){
    let that = this;
    $(".mdl-textfield__input").autocomplete({
      serviceUrl: '/search',
      onSelect: function(suggestion){
        this.value = null
        that.fetchProgram(suggestion.data)
      }
    });

    let calendar = $(this.$el).find('#calendar-1').fullCalendar({
      defaultView: 'agendaDay',
      heigth:'auto', 
      locale: 'sv',
      allDaySlot: false,
      header: {
        left: 'prev',
        center: 'title',
        right:'next'
      },
      height:600,
      events: [],
      droppable: true,
      eventOverlap: false,
      nowIndicator: true,
      snapDuration: 1,
      eventClick: function(event){
        document.querySelector('#snackbar-container').MaterialSnackbar.showSnackbar({
          message: "Remove event",
          actionHandler: function(){
            calendar.fullCalendar('removeEvents', event._id)
          },
          actionText: 'Yes'
        });
      },
      eventStartEditable: true,
      titleFormat: 'YYYY-MM-DD',
      // validRange: {
      //   start: '2017-05-01',
      //   end: '2017-06-01'
      // }
    })

  }
}
</script>

<style scoped>

</style>