import consumer from "./consumer"

consumer.subscriptions.create("ChatChannel", {
  connected() {
    console.log('can you see me?')
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    console.log(data.content);
    $('#chat_list').append('<div class="column is-7">'+'<article class="media">'+'<div class="media-left">'+'<figure class="image 32x32">'+'... '+'</figure>'+'</div>'+'<div class="media-content">'+'<p class="notification conversation-message">'+ data.content +'</p>'+'</div>'+ '</article>'+'</div>');
    $('#chat_list').animate({scrollTop: $('#chat_list').prop("scrollHeight")}, 1000);
  }
});
