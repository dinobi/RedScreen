RSpec.describe Translator do

  let!(:others) { Translator.new('') }
  let!(:swahili_trans) { Translator.new('swahili') }
  let!(:spanish_trans) { Translator.new('spanish') }

  describe 'Greeting' do

    context 'When the language is not supplied' do
      it 'should say hello in english, default' do
        expect(others.greeting).to eql 'Welcome to RedScreen'
      end
    end

    context 'When the language is spanish' do
      it 'should say hello in spanish' do
        expect(spanish_trans.greeting).to eql 'RedScreen, hola mundo'
      end
    end

    context 'When the language is not spanish' do
      it 'should say hello in english' do
        expect(swahili_trans.greeting).to eql 'Welcome to RedScreen'
      end
    end

    it "is case insensitive to all languages" do
      all_caps_language = Translator.new('CHINESE')
      expect(all_caps_language.language).to eql 'chinese'
    end
  end
end