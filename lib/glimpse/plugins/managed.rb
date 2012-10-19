module Glimpse
  class Managed
    include Cinch::Plugin
    include Glimpse::Config
    set( :prefix => "managed ")

    match /list customer(.+|)/,      method: :list_customers
    match /list environments(.+|)/,  method: :list_environments
    match /list clusters(.+|)/,      method: :list_clusters
    match /list servers(.+|)/,       method: :list_servers


    def list_servers(m, args)
      if args.lstrip == "count"
        m.reply(self.connection.query("servers").count)
      else
        m.reply(self.connection.query("servers").join(", "))
      end
    end

    ["environments", "clusters", "customers"].each do |method|
      define_method "list_#{method}" do |m, args|
        if args.lstrip == "count"
          m.reply(self.connection.query("servers/list/#{method}").count)
        else
          m.reply(self.connection.query("servers/list/#{method}").join(", "))
        end
      end
    end # end define method, list_environments, list_clusters, list_customers
  end
end
