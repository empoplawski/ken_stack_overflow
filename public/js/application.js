$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  $(".question-container").on("click", ".question-comment_link", function(event) {
    event.preventDefault();
    $(".question-comment_link").hide();
    $("#create_comment_for_question").removeClass();
  });

  $("#create_comment_for_question").on("submit", function(event){
    event.preventDefault();

    var $form = $(this);
    var url = $form.attr("action");
    var method = $form.attr("method");
    var data = $form.serialize();
    var request = $.ajax({
      url: url,
      method: method,
      data: data
    });

    request.done(function(response){
      $(".question_comments").append("<li>"+response+"</li>");
      $(".question-comment_link").show();
      $("#create_comment_for_question").addClass("hidden");
    });

  });

});
