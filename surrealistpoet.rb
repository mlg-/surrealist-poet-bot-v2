require "rubygems"
require "chatterbot/dsl"
Dir["lib/poetry/*.rb"].each { |file| require_relative file }

  # use_streaming true
  verbose
  no_update

  debug_mode

def raptor_mode?(tweet)
  tweet.text.include?("raptor")
end

def brony_mode?(tweet)
  tweet.text.include?("pony")
end


# loop do
  replies do |tweet|
    puts tweet
    # binding.pry
    raptor_mode = raptor_mode?(tweet)
    brony_mode = brony_mode?(tweet)
    txt = PoemBuilder.new(user: "#USER#", raptor_mode: raptor_mode, brony_mode: brony_mode).poof
    # txt = "hi"
    puts txt

    reply txt, tweet
  end
# end

