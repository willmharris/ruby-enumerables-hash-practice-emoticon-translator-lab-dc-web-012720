require "yaml" 
# require modules here

def load_library(file)
  emotes = YAML.load_file(file)
  jpemote_meaning = emotes.reduce({}) do |memo, (key, value)| 
	  jpemote = emotes[key][1]
	  memo[jpemote] = key 
	  memo
	end
	engemote_jpemote = emotes.reduce({}) do |memo, (key, value)| 
		  engemote = emotes[key][0]
		  memo[engemote] = emotes[key][1] 
		  memo
	end
  library_hash = {
    :get_meaning => jpemote_meaning, :get_emoticon => engemote_jpemote
  } 
end

def get_japanese_emoticon(file, emoticon)
  working_hash = load_library(file)
  if working_hash[:get_emoticon][emoticon] == nil 
    return "Sorry, that emoticon was not found"
  end 
  working_hash[:get_emoticon][emoticon]
end

def get_english_meaning(file, emoticon)
  working_hash = load_library(file)
  if working_hash[:get_meaning][emoticon] == nil 
    return "Sorry, that emoticon was not found"
  end 
  working_hash[:get_meaning][emoticon]
end