$(function(){
  edit_child();
});

function edit_child(){
  $(document).on("click", ".add_child", function() {
    var association = $(this).attr('data-association');
    var target = $(this).attr('target');
    var regexp = new RegExp('new_' + association, 'g');
    var new_id = new Date().getTime();
    var Dest = (target == '') ? $(this).closest("#manage tbody") : $("#"+target+" #manage tbody");
    
    Dest.append(window[association+'_fields'].replace(regexp, new_id));
    return false;
  });

  $(document).on("click" ,".remove_child", function() {
    $(this).closest(".row").find('.removable')[0].value = 1;
    $(this).closest(".row").hide();
    return false;
  });
}

function replace_content(data){
  console.log(data);
  $("body").html(data);
}