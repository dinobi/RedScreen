require 'erubis'

# This class exposes the API for rendering views
class RedScreen::BaseController

  def render(view_name, local_variables={})
    filename = File.join('app', 'views', controller_name, "#{view_name}.erb")
    template = File.read(filename)
    Erubis::Eruby.new(template).result(local_variables)
  end

  def controller_name
    self.class.to_s.gsub(/Controller$/, "").downcase
  end
end