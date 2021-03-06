class Structure

  def self.crab_master(message, bot)
    if Global.searching_crab == 'menu'
      Structure.menu(message, bot)
    end

    if Global.searching_crab == 'order'
      Tree.order(message, bot)
    end

    if Global.searching_crab == 'check_order'
      Structure.check_order(message, bot)
    end

    if Global.searching_crab == 'booking'
      Structure.booking(message, bot)
    end

    if Global.searching_crab == 'feedback'
      Structure.feedback(message, bot)
    end
  end

  def self.menu(message, bot)
    case message
      when Telegram::Bot::Types::CallbackQuery
        if message.data == 'order'
          Global.searching_crab = 'order'
          bot.api.send_message(chat_id: message.from.id, text: "type: 'yes' to go next")
        end

        if message.data == 'booking'
          Global.searching_crab = 'booking'
          bot.api.send_message(chat_id: message.from.id, text: "type: 'yes' to go next")
        end

        if message.data == 'feedback'
          Global.searching_crab = 'feedback'
          bot.api.send_message(chat_id: message.from.id, text: "type: 'yes' to go next")
        end
      when Telegram::Bot::Types::Message
        buttons = [
            Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Make an order', callback_data: 'order'),
            Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Booking', callback_data: 'booking'),
            Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Feedback', callback_data: 'feedback'),
        ]
        markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: buttons)
        bot.api.send_message(chat_id: message.chat.id, text: 'Make a choice', reply_markup: markup)
    end
  end

  def self.order(message,bot, food_list)
    case message
      when Telegram::Bot::Types::CallbackQuery
        yield

      when Telegram::Bot::Types::Message
        markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: food_list)
        bot.api.send_message(chat_id: message.chat.id, text: 'Make a choice', reply_markup: markup)
    end
  end

  def self.check_order(message,bot)
    case message
      when Telegram::Bot::Types::CallbackQuery
        if message.data == 'future'
          bot.api.send_message(chat_id: message.from.id, text: "future")
        end
        if message.data == 'backtomenu'
          Global.searching_crab = 'menu'
          bot.api.send_message(chat_id: message.from.id, text: "type: 'yes' to go back")
        end

      when Telegram::Bot::Types::Message
        check_list = [
            Telegram::Bot::Types::InlineKeyboardButton.new(text: 'future option', callback_data: 'future'),
            Telegram::Bot::Types::InlineKeyboardButton.new(text: 'cancel order', callback_data: 'backtomenu')
        ]
        markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: check_list)
        bot.api.send_message(chat_id: message.chat.id, text: 'Make a choice', reply_markup: markup)
    end
  end

  def self.booking(message,bot)
    case message
      when Telegram::Bot::Types::CallbackQuery
        if message.data == 'future'
          bot.api.send_message(chat_id: message.from.id, text: "future")
        end

        if message.data == 'backtomenu'
          Global.searching_crab = 'menu'
          bot.api.send_message(chat_id: message.from.id, text: "type: 'yes' to go back")
        end

      when Telegram::Bot::Types::Message
        booking_list = [
            Telegram::Bot::Types::InlineKeyboardButton.new(text: 'future option', callback_data: 'future'),
            Telegram::Bot::Types::InlineKeyboardButton.new(text: 'back', callback_data: 'backtomenu')
        ]
        markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: booking_list)
        bot.api.send_message(chat_id: message.chat.id, text: 'Make a choice', reply_markup: markup)
    end
  end

  def self.feedback(message,bot)
    case message
      when Telegram::Bot::Types::CallbackQuery
        if message.data == 'future'
          bot.api.send_message(chat_id: message.from.id, text: "future")
        end

        if message.data == 'backtomenu'
          Global.searching_crab = 'menu'
          bot.api.send_message(chat_id: message.from.id, text: "type: 'yes' to go back")
        end

      when Telegram::Bot::Types::Message
        feedback_list = [
            Telegram::Bot::Types::InlineKeyboardButton.new(text: 'future option', callback_data: 'future'),
            Telegram::Bot::Types::InlineKeyboardButton.new(text: 'back', callback_data: 'backtomenu')
        ]
        markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: feedback_list)
        bot.api.send_message(chat_id: message.chat.id, text: 'Make a choice', reply_markup: markup)
    end
  end

end

