class Hello
  include Cinch::Plugin

  match "yo"

  def execute(m)
    m.reply "#{m.user.nick}, you're a towel"
  end
end
