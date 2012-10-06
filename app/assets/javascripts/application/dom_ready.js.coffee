$ ->

  # forms --------------------------------------------------------------------
  
  # form submit buttons (for links)
  # this is needed because "button" and "a" styles render different
  $('form .submit').on 'click', ->
    $(this).closest('form').submit()
    
    
  # list item form -----------------------------------------------------------

  $form = $('form.new_list_item')

  # toggle note display
  $form.find('.add_note a').on 'click', =>
    $form.find('.note').slideToggle()
  
  # clear form data
  $form.find('.cancel').on 'click', =>
    $form[0].reset()