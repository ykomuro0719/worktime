# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'change', '#work_task_id', ->
  $.ajax(
    type: 'GET'
    url: '/works/getchild1'
    data: {
      task_id: $(this).has('option:selected').val()
    }
  )


$(document).on 'change', '#work_task_id', ->
  $.ajax(
    type: 'GET'
    url: '/works/getrequest'
    data: {
      task_id: $(this).has('option:selected').val()
    }
  )
    
  $(document).on 'change', '#work_child1task_id', ->
  $.ajax(
    type: 'GET'
    url: '/works/getchild2'
    data: {
      child1task_id: $(this).has('option:selected').val()
    }
  )