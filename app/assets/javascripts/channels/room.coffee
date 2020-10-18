jQuery(document).on 'turbolinks:load', ->
  rooms = $('#rooms')

  # {}の中に記述でパラメータとしてchannelに渡せる
  App.room = App.cable.subscriptions.create { channel: "RoomChannel", room_id: rooms.data('room') },

  # 通信が確立された時
  connected: ->


  # 通信が切断された時
  disconnected: ->


  # 値を受け取った時
  received: (data) ->
    # サーバーサイドから値を受け取る
    $('#chats').append("<p>"+data["message"]+"</p>");

  speak: (message) ->
  # サーバーサイドのspeakアクションにmessageパラメーターを渡す
    @perform 'speak', message: message

  $(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
    if event.keyCode is 13
      # speak メソッド, event.target.valueを引数に
      App.room.speak [event.target.value, $('[data-user_id]').attr('data-user_id'), $('[data-room_id]').attr('data-room_id')]
      event.target.value = ''
      event.preventDefault()
