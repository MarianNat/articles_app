$(document).on 'page:update', ->
  $('.del_article').on "ajax:success", (status, data, xhr) ->
    if data.status == 'ok'
      $(this).parent().parent().remove()

  