function like () {
  let element = document.getElementById('like-icon')
  if (element != null) {
    document.getElementById('like-icon').addEventListener("click", function() {
      $.ajax({
        method:'GET',
        url: '/users/:user_id/events/:event_id/likes/new',
        dataType: "html",
        data: { content: "hello" }
      });
    });
  }
}
export { like };
