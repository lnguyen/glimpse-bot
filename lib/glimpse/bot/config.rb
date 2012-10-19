module Glimpse
  module Config

    def application_name
      return @application_name if @application_name
      @application_name = self.class.to_s.split("::")[1].downcase
      @application_name
    end

    def connection
      return @connection if @connection
      @connection = Connection.new({:application => application_name}.merge(application_config[application_name]))
      @connection
    end

    def application_config
      return @config if @config
      puts Dir.pwd
      @config = YAML::load_file("#{application_home_path}/config.yml")
      @config
    end

    def application_home_path
      return @application_home_path if @application_home_path
      @application_home_path = File.join(home_path, "bot")
      Dir.mkdir(@application_home_path) unless File.exists?(@application_home_path)
      @application_home_path
    end


    def home_path
      return @home_path if @home_path
      @home_path = File.join(Dir.home,".glimpse")
      Dir.mkdir(@home_path) unless File.exists?(@home_path)
      @home_path
    end


  end
end
