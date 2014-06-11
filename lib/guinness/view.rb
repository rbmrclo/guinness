class Guinness::View

  def initialize(template)
    @template = template
  end

  # return a view body or nil if adequate template cannot be found
  def render
    template_body = Tilt.new(@template).render(self)
    if @layout
      layout = Dir[File.join(File.dirname(@template), @layout) + '*'].first
      raise "#{Guinness::EMOJI} Guinness : Unable to locate layout at: '#{@layout}'" unless layout
      @body = Tilt.new(layout).render(self) { template_body }
    end
    @body || template_body
  end

end
