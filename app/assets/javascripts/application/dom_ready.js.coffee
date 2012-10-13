$ ->
  
  # lists --------------------------------------------------------------------
  
  $('.list_items').sortable
    connectWith: '.list_items',
    items: '.list_item',
    beforeStop: (e, ui) ->
      # list item
      $li = ui.item
      li_id = $li.attr('id').replace('list_item_','')
      # category
      $category = $li.closest('.category')
      category_id = $category.attr('id').replace('category_','')
      # list
      $list = $li.closest('.list')
      list_id = $list.attr('id').replace('list_','')
      # position
      position = $('.list_item').index($li)
      $.ajax
        type: 'PUT',
        url: "/list/#{list_id}/list_items/#{li_id}/position"
        dataType: 'json',
        data: 
          list_item:
            position: position,
            category_id: category_id
  .disableSelection()


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
    