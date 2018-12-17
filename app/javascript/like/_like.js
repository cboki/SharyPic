function like () {
  document.getElementById('like-icon').addEventListener("click", function() {

    console.log ("hello World");
    $.ajax({
      method:'GET',
      url: '/users/:user_id/events/:event_id/likes/new',
      dataType: "html",
      data: { content: "hello" }
    });
  });
}

export { like };
