# This file will be used to create an instance of my rack application
#
class RedScreen::Application

  # This method is called by default on all rack application and accepts
  # an env(Array) of information that the server needs to process requests
  #
  def call(env)
    #TODO: check if controller or action are empty string, then assign 'index'
    if env['PATH_INFO'] == "/"
      return [200, {"Content-Type" => "text/html"}, ['Welcome to RedScreen']]
    end

    if env['PATH_INFO'] == "/home"
      return [302, {"Location" => "/"}, ['Welcome to RedScreen']]
    end

    if env['PATH_INFO'] == "/favicon.ico"
      return [500, {}, []]
    end

    response env
  end

  # This method returns an array, containing a server response in the format
  # that a browser understands
  #
  def response(env)
    # env comes from the client and I will be using the PATH_INFO attribute
    # to know what the client has requested
    #
    # env['PATH_INFO'] specifies the current url path a request was directed
    # :PATH_INFO => "/todos" : TodosController.send(:index)
    # :PATH_INFO => "/todos/create" : TodosController.send(:create)
    #
    # This expression evaluates to an array of two elements (A class constant, and a string)
    # that will be assigned respectively
    #
    controller_class, action = get_controller_and_action(env)

    # Here I create an instance of the controller class and send the action as message

    response_body = controller_class.new.send(action)

    # Render view by the action method name if render function
    # was never called at the end of an action method definition.
    # Find the view to render using the action method name
    if response_body.nil? || response_body[1] != :render_called
      response_body = controller_class.new.render(action, response_body)
    end

    [200, {"Content-Type" => "text/html"}, response_body[0]]

  end


  def get_controller_and_action(env)
    # env['PATH_INFO'] specifies the current url path a request was directed
    # :PATH_INFO => "/todos", when split will produce ["", "todos"]
    # :PATH_INFO => "/todos/create", when split will produce ["", "todos", "create"]
    #
    # so we will always assign the first element to the dump variable(underscore)
    # the controller will always take the second element and the last element is the action
    # if there is no last element, the index action is passed to the controller
    #
    _, controller_name, action = env['PATH_INFO'].split('/')

    # default action to the 'index action' if action is nil or empty string
    action = 'index' if action.nil? || action == ''

    # create the controller name constant
    controller_name = controller_name.to_camel_case + 'Controller'
    [Object.const_get(controller_name), action]
  end

end