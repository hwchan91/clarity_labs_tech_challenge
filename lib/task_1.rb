def count_words(str)
  hash = Hash.new(0)
  output = []

  word = /\w+(?:['|-]\w+)*/
  words = str.scan(word)
  words.each do |word|
    word.downcase!
    hash[word] += 1
  end
  hash = hash.sort_by {|k,v| v}.reverse

  hash.each {|word, count| output.push({count: count, word: word}) }
  output

end

p "input: 'Brown fox jumped, over brown fox!'"
p count_words("Brown fox jumped, over brown fox!")
