require "http"
system "clear"
api_key = "ENTER API KEY"

puts "Enter a word."
word = gets.chomp

response1 = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=#{api_key}")


response2 = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/pronunciations?useCanonical=false&limit=50&api_key=#{api_key}"
)
word_definition = response1.parse(:json)
word_pronunciation = response2.parse(:json)

definition = word_definition[1]["text"]


top_example = word_definition[3]["exampleUses"][0]["text"]

pronunciation = word_pronunciation[0]["raw"]
# pp word_definition
# pp word_pronunciation


puts "The definition of #{word} is '#{definition}' The top example of the usage of this word is '#{top_example}' This word is pronounced '#{pronunciation}'."
