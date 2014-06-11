class Guinness::Application

  attr_accessor :settings, :builder

  def initialize(options = {})
    @settings = { output_dir: '../' }.merge options
    
    app = self
    @builder = Rack::Builder.new do |builder|
      use Rack::CommonLogger
      use Rack::ShowStatus      # Nice looking 404s and other messages
      use Rack::ShowExceptions  # Nice looking errors
      use Rack::Static, :urls => ["/stylesheets", "/javascripts", "/images"]
      run Guinness::Server.new app
    end
  end

  def serve
    Rack::Handler::Thin.run @builder, Port: 9393
  end

end
