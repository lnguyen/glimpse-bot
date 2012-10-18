module Glimpse
  class Managed
    #class << self
    #
      include Cinch::Plugin
      include Glimpse::Config

      match /managed list customer/
      def execute(m)
        m.reply("yo")
        #self.connection.query("servers/list/customers")
      end

    #end
  end
end
