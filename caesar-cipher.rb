require 'sinatra'

require 'sinatra/reloader' if development?

@@message = ""

def caesar(input_phrase, shifting)
  new_phrase = ""
  i = 0
  upper_alphabet = ("A".."Z").to_a
  lower_alphabet = ("a".."z").to_a
    while i < input_phrase.to_s.length do
      if upper_alphabet.include?(input_phrase[i])
        word_change = (upper_alphabet.index(input_phrase[i]) + shifting.to_i) % 26
        new_phrase += upper_alphabet[word_change]
        i += 1
      elsif lower_alphabet.include?(input_phrase[i])
        word_change = (lower_alphabet.index(input_phrase[i]) + shifting.to_i) % 26
        new_phrase += lower_alphabet[word_change]
        i += 1
      else
        new_phrase += input_phrase[i]
        i+=1
      end
    
    end
  @@message = new_phrase
  
  end

get '/' do
  input_phrase = params['phrase']
  shifting = params['shifting']
  caesar(input_phrase, shifting)
  erb :index, :locals => {:message => @@message}
end