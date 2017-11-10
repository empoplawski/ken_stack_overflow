$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  $(".question-container").on("click", ".question-comment_link", function(event) {
    event.preventDefault();
    $(".question-comment_link").hide();
    $("#create_comment_for_question").removeClass();
    // console.log("hello")

    // var $button = $(this);
    // var url = $button.attr("href");
    // console.log(url);
    // var request = $.ajax({
    //   url: url
    // })
    // request.done(function(response){
    //   console.log(response);
    // })


  })
});
