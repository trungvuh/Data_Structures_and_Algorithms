require_relative 'p05_hash_map'

def can_string_be_palindrome?(string)
  string.length.times do |i|
    return false if string[i] != string[string.length - 1 - i ]
  end
  true
end
