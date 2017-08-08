class Tree
  def self.order(message,bot)
    food_list = [
        Telegram::Bot::Types::InlineKeyboardButton.new(text: 'sample1', image: './img/crab.jpeg',  callback_data: 'sample1'),
        Telegram::Bot::Types::InlineKeyboardButton.new(text: 'sample2', callback_data: 'sample2'),
        Telegram::Bot::Types::InlineKeyboardButton.new(text: 'sample3', callback_data: 'sample3'),
        Telegram::Bot::Types::InlineKeyboardButton.new(text: 'sample4', callback_data: 'sample4'),
        Telegram::Bot::Types::InlineKeyboardButton.new(text: 'check your order', callback_data: 'check_order'),
        Telegram::Bot::Types::InlineKeyboardButton.new(text: 'back', callback_data: 'backtomenu')
    ]

    Structure.order(message, bot, food_list) do
      if message.data == 'sample1'
        bot.api.send_message(chat_id: message.from.id, text: "sample1 inda list!")
      end
      if message.data == 'sample2'
        bot.api.send_message(chat_id: message.from.id, text: "sample2 inda list!")
      end
      if message.data == 'sample3'
        bot.api.send_message(chat_id: message.from.id, text: "sample3 inda list!")
      end
      if message.data == 'sample4'
        bot.api.send_message(chat_id: message.from.id, text: "sample4 inda list!")
      end
      if message.data == 'check_order'
        Global.searching_crab = 'check_order'
        bot.api.send_message(chat_id: message.from.id, text: "type: 'yes' to go next")
      end
      if message.data == 'backtomenu'
        Global.searching_crab = 'menu'
        bot.api.send_message(chat_id: message.from.id, text: "type: 'yes' to go back")
      end
    end
  end
end