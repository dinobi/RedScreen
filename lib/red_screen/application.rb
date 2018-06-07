class RedScreen::Application
  def call(env)
    response
  end

  def response
    [200, {}, []]
  end
end