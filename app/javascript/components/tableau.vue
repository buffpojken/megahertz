<template>

  <section class="mdl-layout__tab-panel is-active">
    <div class="page-content">
        <div class="mdl-grid">
          <div class="mdl-cell mdl-cell--4-col mdl-cell--2-offset-desktop">
            <form action="#">
              <div class="mdl-textfield mdl-js-textfield">
                <input class="mdl-textfield__input" type="text" id="sample1">
                <label class="mdl-textfield__label" for="sample1">Text...</label>
              </div>
            </form>

            <ul class="demo-list-icon mdl-list">
              <li class="mdl-list__item">
                <span class="mdl-list__item-primary-content">
                <i class="material-icons mdl-list__item-icon">person</i>
                Bryan Cranston
            </span>
              </li>
              <li class="mdl-list__item">
                <span class="mdl-list__item-primary-content">
                <i class="material-icons mdl-list__item-icon">person</i>
                Aaron Paul
              </span>
              </li>
              <li class="mdl-list__item">
                <span class="mdl-list__item-primary-content">
                <i class="material-icons mdl-list__item-icon">person</i>
                Bob Odenkirk
              </span>
              </li>
            </ul>

          </div>
          <div class="mdl-cell mdl-cell--4-col">
            <div id="calendar-1"></div>
          </div>
        </div>
    </div>
  </section>

</template>

<script>
export default {
  data: function () {
    return {
      message: "Hello Vue!"
    }
  },
  mounted: function(){
    $(this.$el).find('#calendar-1').fullCalendar({
      defaultView: 'agendaDay',
      heigth:'auto', 
      locale: 'sv',
      allDaySlot: false,
      header: {
        left: 'prev',
        center: 'title',
        right:'next'
      },
      titleFormat: 'YYYY-MM-DD',
      validRange: {
        start: '2017-05-01',
        end: '2017-06-01'
      }
    })
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>