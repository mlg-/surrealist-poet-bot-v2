require "marky_markov"
require_relative "dictionary"

class DictionaryBuilder
  attr_reader :dictionaries

  def initialize(*dictionary_types)
    dictionary_types.flatten.each do |dictionary_type|
      dictionary = Dictionary.new(name: dictionary_type)
      dictionary.build
      @dictionaries << dictionary
    end
  end

  private
  attr_writer :dictionaries
end
