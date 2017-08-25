require "task_1"

describe "count words function" do
  it "tests 'Brown fox jumped, over brown fox!'" do
    result = count_words("Brown fox jumped, over brown fox!")
    expect(result.find{|hash| hash[:word] == "fox"}[:count]).to eq(2)
    expect(result.find{|hash| hash[:word] == "brown"}[:count]).to eq(2)
    expect(result.find{|hash| hash[:word] == "jumped"}[:count]).to eq(1)
    expect(result.find{|hash| hash[:word] == "over"}[:count]).to eq(1)

    match_all_counts(result, [["fox", 2], ["brown", 2], ["jumped", 1], ["over", 1], ["test", 0]])
    is_sorted(result)
  end
end

describe "count words function" do
  it "tests 'The richest man is not he who has the most, but he who needs the least.'" do
    result = count_words("The richest man is not he who has the most, but he who needs the least.")
    match_all_counts(result, [["the", 3], ["who", 2], ["he", 2], ["needs", 1], \
                              ["but", 1], ["most", 1], ["not", 1], ["is", 1], \
                              ["man", 1], ["richest", 1], ["test", 0]])
    is_sorted(result)
  end
end

describe "count words function" do
  it "tests 'You must be the change you wish to see in the world.'" do
    result = count_words("You must be the change you wish to see in the world.")
    match_all_counts(result, [["the", 2], ["you", 2], ["world", 1], ["in", 1], \
                              ["see", 1], ["to", 1], ["wish", 1], ["change", 1], \
                              ["be", 1], ["must", 1],["test", 0]])
    is_sorted(result)
  end
end

def match_all_counts(result, arr)
  arr.each do |word, count|
    match_count(result, word, count)
  end
end

def match_count(result, word, count)
  match = result.find{|hash| hash[:word] == word}
  expect(match ? match[:count]: 0).to eq(count)
end

def is_sorted(result)
  counts_of_result = result.map{|hash| hash[:count]}
  expect(counts_of_result == counts_of_result.sort.reverse).to be true
end
