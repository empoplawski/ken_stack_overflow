$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  $(".question-container").on("click", ".question-comment_link", function(event) {
    event.preventDefault();
    $(".question-comment_link").hide();
    $("#create_comment_for_question").removeClass();
  })

  $("#create_comment_for_question").on("submit", function(event){
    event.preventDefault();
    // console.log("hello");

    var $form = $(this);
    var url = $form.attr("action");
    var method = $form.attr("method");
    var data = $form.serialize();

    // console.log(url);
    // console.log(method);
    // console.log(data);
    var request = $.ajax({
      url: url,
      method: method,
      data: data
    })
    request.done(function(response){
      // $(".question_comments").append(response);
      console.log(response);
    })

    request.fail(thing1, thing2, thing3){

    }

  })





});
