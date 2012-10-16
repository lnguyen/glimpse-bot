require 'cinch'

class Hello
  include Cinch::Plugin

  match "yo"

  def execute(m)
    m.reply "#{m.user.nick}, you're a towel"
  end
end

bot = Cinch::Bot.new do
  configure do |c|
    c.nick = "GlimpseBot"
    c.server = "irc.freenode.org"
    c.channels = ["#lnguyen_test"]
    c.plugins.plugins = [Hello]
  end
end

bot.start
