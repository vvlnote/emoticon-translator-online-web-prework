# require modules here
require "yaml"
def load_library(file_name)
  # code goes here
  a_hash = {}
  a_hash =YAML.load_file(file_name)
  #puts "a_hash = #{a_hash}"
  new_hash = {}
  new_hash["get_emoticon"] = {}
  new_hash["get_meaning"] = {}
  a_hash.each do |key, values|
    new_hash["get_meaning"][values[1]] = key
    new_hash["get_emoticon"][values[0]] = values[1]
  end
  #puts "new_hash = #{new_hash}"
  new_hash
end

def get_japanese_emoticon(file_path_name, emoticon)
  # code goes here
  a_hash = {}
  a_hash = load_library(file_path_name)
  japanese_emoticon = ""
  if a_hash["get_emoticon"].has_key?(emoticon)
    japanese_emoticon = a_hash["get_emoticon"][emoticon]
  else
    japanese_emoticon = "Sorry, that emoticon was not found"
  end
  japanese_emoticon
end

def get_english_meaning (file_path_name, emoticon)
  # code goes here
  english_meaning = ""
  a_hash = {}
  a_hash = load_library(file_path_name)
  if a_hash["get_meaning"].has_key? emoticon
    english_meaning = a_hash["get_meaning"][emoticon]
  else
    english_meaning = "Sorry, that emoticon was not found"
  end
  english_meaning
end