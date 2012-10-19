module Glimpse
  class Connection
    def initialize(options = {})
      raise ":application must be given to #{self.class.name}.new" if options[:application].nil?
      raise ":id must be given to #{self.class.name}.new" if options[:id].nil?
      raise ":url must be given to #{self.class.name}.new" if options[:url].nil?
      raise ":auth must be given to #{self.class.name}.new" if options[:auth].nil?

      @application = options[:application].downcase
      @id = options[:id]
      @url = options[:url]
      @auth = options[:auth]
    end

    def query(endpoint)
      Yajl::Parser.parse(client.get("#{@url}/#{@application}/#{endpoint}").body)
    end

    def client
      return @client if @client
      #FIX ME, class method don't work in block wtf
      auth = @auth
      id = @id
      @client = Rack::Client.new do
        use Rack::Config do |env|
          env['HTTP_DATE'] = Time.now.httpdate
        end
        use EY::ApiHMAC::ApiAuth::Client, "#{id}", "#{auth}"
        run Rack::Client::Handler::NetHTTP
      end
      @client
    end
  end # end Connection
end # end Glimpse
