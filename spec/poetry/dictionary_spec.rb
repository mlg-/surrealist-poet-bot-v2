require_relative "../spec_helper"
require_relative "../../lib/poetry/dictionary"

describe Dictionary do
  subject(:dictionary) { Dictionary.new(name: name) }

  let(:name) { "raptor" }

  describe "#name" do
    it { expect(dictionary.name).to eq(name) }
  end

  describe "#build" do
    let(:markov_dictionary) { double }

    before do
      allow(MarkyMarkov::Dictionary).to receive(:new).with(name).and_return(markov_dictionary)
      allow(markov_dictionary).to receive(:parse_file).with("/source_texts/#{name}.txt")
      allow(markov_dictionary).to receive(:save_dictionary!)

      dictionary.build
    end

    it "parses the text file of the same name" do
      expect(markov_dictionary).to have_received(:parse_file).with("/source_texts/#{name}.txt")
    end

    it "persists the dictionary" do
      expect(markov_dictionary).to have_received(:save_dictionary!).once
    end
  end
end
