class RoomChannel < ApplicationCable::Channel

  # 接続された時
  def subscribed
    # フロントとバックが通信している時（お互いを監視している時）に実行される
    stream_from "room_channel"
  end

  # 切断された時
  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  # speak(message)を受け取りchatを作る
  def speak(message)
    chat = Chat.new(message: message['message'][0], user_id: message['message'][1].to_i, room_id: message['message'][2].to_i)
    chat.save
    ActionCable.server.broadcast 'room_channel', message: message['message'][0]
  end

end
