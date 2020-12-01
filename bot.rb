require 'telegram_bot'
token = '1492975405:AAE-54E5PbZgB3Yl2V92Ahm9SO934GqSBII'
bot = TelegramBot.new(token: token)

bot.get_updates(fail_silently: true) do |message|
    puts "@#{message.from.username}: #{message.text}"
    command = message.get_command_for(bot)
  
    message.reply do |reply|
      case command
        # /start
        when /start/i
          reply.text = "All I can do is say hello. Try the /greet and /download command."
        # /greet
        when /greet/i
          reply.text = "Hello, #{message.from.first_name}. 🤖"
        when /download/i
          reply.text = "
          Link Download kebutuhan opersional TH : /link_download_it 
          \n WARP 1.1.1. : /warp
          \n IT & Trainer : /itrainer
          "
        when /link_download_it/i
          reply.text = "bit.ly/itjabar atau s.id/itjabar"
        when /warp/i
          reply.text = "1.1.1.1/beta"
        when /itrainer/i
          reply.text = "
            Sastra : @Sastra_ITrainer
          "   
      end
      puts "sending #{reply.text.inspect} to @#{message.from.username}"
      reply.send_with(bot)
    end
end
