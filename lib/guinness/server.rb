class Guinness::Server

  def initialize(app)
    @app = app
  end

  def call(env)
    body = render File.join(@app.settings[:root], env['PATH_INFO'])
    if body
      [200, { 'Content-Type' => Rack::Mime.mime_type(File.extname(env['PATH_INFO']), 'text/html') }, [body]]
    else
      [404, { 'Content-Type' => 'text/plain' }, 'Not Found']
    end
  end

  def render(path)
    return File.read path if File.file? path

    # default to index if path to directory
    path = File.join(path, 'index') if Dir.exists? path

    # return the first filename that matches file
    template = Dir[File.join("#{path}*")].first
    return Guinness::View.new(template).render if template
  end

end
