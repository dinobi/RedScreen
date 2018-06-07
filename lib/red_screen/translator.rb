# translator class file
class RedScreen::Translator
  attr_accessor :language
  def initialize(language)
    @language = language.nil? ? '' : language.downcase
  end

  def greeting
    case @language
    when 'spanish'
      'RedScreen, hola mundo'
    else
      'Welcome to RedScreen'
    end
  end
end