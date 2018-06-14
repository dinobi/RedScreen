# expose top level RedScreen.greeting API
module RedScreen

  autoload :Application, 'red_screen/application'
  autoload :Translator, 'red_screen/translator'
  autoload :BaseController, 'red_screen/base_controller'
  require 'red_screen/utils'

  def self.greeting(language = 'English')
    translator = Translator.new(language)
    translator.greeting
  end

  def self.connect(env)
    Application.new.call env
  end

end



