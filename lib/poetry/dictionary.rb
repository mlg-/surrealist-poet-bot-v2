require "marky_markov"
require "pry"

class Dictionary
  attr_accessor :name

  def initialize(name:)
    @name = name
  end

  def build
    markov_chain_dictionary = MarkyMarkov::Dictionary.new("#{name}")
    markov_chain_dictionary.parse_file(File.join(File.dirname(__FILE__), "../../source_texts/#{name}.txt"))
    markov_chain_dictionary.save_dictionary!
  end
end
