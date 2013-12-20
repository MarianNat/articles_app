$(document).on 'page:update', ->
  $('.del_article').on "ajax:success", (status, data, xhr) ->
    if data.status == 'ok'
      $(this).parent().parent().remove()

$ ->
  $(window).scroll ->
    if $(window).scrollTop() > $(document).height() - $(window).height() - 30
      $('footer').stop().animate({'opacity': 1}, 1000)
    else
      $('footer').stop().animate({'opacity': 0}, 1000)
