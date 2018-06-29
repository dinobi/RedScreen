# Use tilt gem
require 'tilt/erb'


class RedScreen::BaseController

  def render(view_name, local_variables = {})
    filename = File.join('app', 'views', controller_name, "#{view_name}.erb")
    template = Tilt::ERBTemplate.new(filename)

    # Provide scope for evaluating the template within the view context
    # [NOTE: tilt render can be called multiple times with different scopes]
    context = ViewContext.new(view_name, controller_name)

    output = template.render(context, local_variables)
    [[ output ], :render_called]
  end


  def controller_name
    self.class.to_s.gsub(/Controller$/, "").to_snake_case
  end

end

# Add a customizable view context class
class ViewContext
  def initialize(view_name, controller_name)
    @view_name = view_name.to_s
    @controller_name = controller_name
  end

  def title
    "#{@view_name.to_camel_case} #{@controller_name.to_camel_case}"
  end
end