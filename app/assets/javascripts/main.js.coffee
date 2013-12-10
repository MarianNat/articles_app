###
$ ->
  $('.del_article').click ->
    href = $(this).attr('href')
    href += "?ajax=1"
    console.log(href)
    $.ajax({
      url: href,
      type: 'DELETE'
    })
    return false
### 
$ ->
  $('.del_article').on "ajax:complete", (xhr, status) ->
    if status.responseText == 'ok'
      $(this).parent().parent().remove()

  