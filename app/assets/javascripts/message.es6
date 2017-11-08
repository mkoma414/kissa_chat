$(function(){

  function buildHTML(data){
    var html = `<div class='main__contents__message'>
                <div class='main__contents__message_body'>
                  ${data.body}
                </div>
                <div class='main__contents__message_image'>
                  <img src="${data.image}" />
                </div>
                <div class='main__contents__message_name'>
                  ${data.user_name}
                </div>
              </div>
              `;
    return html;
  }


  $('#new_message').on('submit', function(e){
    e.preventDefault();

    var formData = new FormData(this);
    var url = $(this).attr('action');

    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    }).done(function(data){
      $('.input-form').val('');
      $('.file-form').val('');
      // console.log(this[0]);
      var formData = new FormData(this);
      $('.main__contents').append(buildHTML(data));
      $('.main__contents').animate({scrollTop: $('.main__contents')[0].scrollHeight}, 500);

    }).fail(function(){
      alert('error');
    })
    return false;
  });
});
