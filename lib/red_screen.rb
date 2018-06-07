# expose top level RedScreen.greeting API
module RedScreen

  autoload :Application, 'red_screen/application'
  autoload :Translator, 'red_screen/translator'

  def self.greeting(language = 'English')
    translator = Translator.new(language)
    translator.greeting
  end

  def self.connect(env)
    Application.new.call env
  end

end



