require_relative "../spec_helper"
require_relative "../../lib/poetry/dictionary_builder"

describe DictionaryBuilder do
  subject(:dictionary_builder) { DictionaryBuilder.new(dictionary_names) }

  let(:dictionary_names) { ["raptor", "bloop", "shakespeare"] }

  describe "#dictionary" do
    it "creates a dictionary for each name" do
      dictionary_names.each do |name|
        expect(dictionary_builder.dictionaries).to all(be_a Dictionary)
          .and satisfy { |dictionary| dictionary_names.include?(dictionary.name) }
      end
    end
  end
end
