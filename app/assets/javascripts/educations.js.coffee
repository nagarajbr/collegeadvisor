# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
  $(document).on "change", "category_selected",  ->
    console.log("OK")
    category_selected = $(this)
    category = $category_selected.text()
    console.log("#{category}") 
    escaped_category = category.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $category_selected.parent().find('.course_selected').filter("optgroup[label='#{escaped_category}']").html()
    if options
      $('#course_selected').html(options)
      $('#course_selected').parent().show()
    else
      $('#course_selected').empty()
      $('#course_selected').parent().hide()

  