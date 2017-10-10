$(function() {
    $('.pagination[remote=true] a').live 'click', ->
      window.history.pushState(null, 'hi', $(this).attr("href"))
      $.rails.handleRemote($(this))
      return false
});