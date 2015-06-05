$(document).ready(function() {
  if ($("body").attr("id") == "users") {
    var pusher = new Pusher('028a87de58f9d41e6158');
    var channel = pusher.subscribe('notification');
    channel.bind('checkin_notification', function(data) {
      prompt_user('myModal', data.message, 30000);
    });
  }
});

function prompt_user(modal_id, message, timeout) {
  $('#' + modal_id + ' .modal-body').html(message);

  var dismiss_text = $('#' + modal_id + ' .modal-footer button[data-dismiss]').html();
  console.log(dismiss_text);
  $('#' + modal_id + ' .modal-footer button[data-dismiss]').html(dismiss_text + ' (' + timeout / 1000 + ')');

  $('#' + modal_id).modal('show');
  
  setTimeout(function() { 
    modal_dismiss_timeout_handler(modal_id, timeout, dismiss_text)
  }, 1000);
}

// Assume timeout is integer multiple of 1000.
function modal_dismiss_timeout_handler(modal_id, timeout, dismiss_text) {
  if (timeout >= 1000) {
    $('#' + modal_id + ' .modal-footer button[data-dismiss]').html(dismiss_text + ' (' + (timeout / 1000 - 1) + ')');
      setTimeout(function() { 
        modal_dismiss_timeout_handler(modal_id, timeout - 1000, dismiss_text)
      }, 1000);
  } else {
    $('#myModal').modal('hide');
    $('#' + modal_id + ' .modal-footer button[data-dismiss]').html(dismiss_text);
  }
}