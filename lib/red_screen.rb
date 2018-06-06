require 'red_screen/translator'

# expose top level RedScreen.greeting API
module RedScreen
  def self.greeting(language = 'English')
    translator = Translator.new(language)
    translator.greeting
  end
end

