module Glimpse
  module Bot
    class Console
      class << self
        def run!
          require 'irb'
          IRB.start
        end # end run
      end
    end # end Console
  end # end Bot
end # end Glimpse
