function on_users_ui_update() {
  $('a.save-button').click(function(e) {
    $(this).addClass('save-button-just-clicked');
  });
}