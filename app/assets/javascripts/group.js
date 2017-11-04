$(function(){

  function append_users(data){
    console.log(data);
    $('#user-search-result').empty();
    $.each(data.users, function (index, user) {
      $('#user-search-result').append(buildHTML(user));
    });
  }

  function append_users_to_members(id, name){
    $('#add-current-user').append(buildHTML_for_members(id, name));
  }

  function buildHTML(user){
    html = `<div class = "searched_user", data-user-id = "${user.id}">
              <div class = "searched_user_name">
                  ${user.name}
              </div>
              <div class = "add_user_btn">
                追加
              </div>
            </div>
          `
    return html;
  }

  // function buildHTML_for_members(id, name){
  //   html = `<div class = "searched_user", data-user-id = "${id}">
  //             <div class = "searched_user_name">
  //                 ${name}
  //             </div>
  //             <div class = "remove_user_btn">
  //               削除
  //             </div>
  //             <input value=${id} name="group[user_ids][]" type="hidden" id="group_user_ids">
  //           </div>
  //         `
  //   return html;
  // }




function buildHTML_for_members(id, name){
  html = `
          <div class='current-users clearfix'>
            <div class='current-users-name'>
              ${name}
            <input value=${id} name="group[user_ids][]" id="group_user_ids" type="hidden" />
            </div>
            <div class='remove-user-btn'>
              <i class='fa fa-times'></i>
            </div>
          </div>
          `
  return html;
}





  $(document).on('click', '.add_user_btn', function(){
    var name = $(this).prev()[0].innerHTML;
    var id = $(this).parent().data('user-id');

    $(this).parent().remove();
    // append_users_to_members(id, name);

    append_users_to_members(id, name);

  });

  $(document).on('click', '.remove-user-btn', function(){
    var name = $(this).prev()[0].innerHTML;
    var id = $(this).parent().data('user-id');

    $(this).parent().remove();
    // append_users_to_members(id, name);
  });

  $('#chat_group_user').on('keyup', function(){

    var key = $('#chat_group_user').val();
    console.log("keyup");

    $.ajax({
      url: '/users/search',
      type: "GET",
      data: {
        search_key: key
      },
      dataType: 'json',
    }).done(function(data){
      console.log("done");
      append_users(data);
    }).fail(function(){

    })
  })



})