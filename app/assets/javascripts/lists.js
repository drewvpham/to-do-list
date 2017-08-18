
$(function(){
  $("input.toggle").on("change", function(){
    console.log($(this).parents("form"));
    $(this).parents("form").trigger("submit")
  })
});
