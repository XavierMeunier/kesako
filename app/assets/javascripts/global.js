$(function(){
  edit_child();
});

// Edit child objects
function edit_child(){
  // Add child objects
  $(document).on("click", ".add_child", function() {
    var association = $(this).attr('data-association');
    var target = $(this).attr('target');
    var regexp = new RegExp('new_' + association, 'g');
    var new_id = new Date().getTime();
    var Dest = (target == '') ? $(this).closest("#manage tbody") : $("#"+target+" #manage tbody");
    
    Dest.append(window[association+'_fields'].replace(regexp, new_id));
    return false;
  });

  // Remove child objects
  $(document).on("click" ,".remove_child", function() {
    $(this).closest(".row").find('.removable')[0].value = 1;
    $(this).closest(".row").hide();
    return false;
  });
}