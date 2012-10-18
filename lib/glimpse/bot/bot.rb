
bot = Cinch::Bot.new do
  configure do |c|
    c.nick = "GlimpseBot"
    c.server = "irc.freenode.org"
    c.channels = ["#lnguyen_test"]
    c.plugins.plugins = [Hello, Glimpse::Managed]
  end
end

bot.start
