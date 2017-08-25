require "task_2"

describe "group_fused_rods function" do
  it "should group fused rods together" do
    result = group_fused_rods(5, ["1 2 3", "4 5", "1 4"])
    expect(result_include_group(result, [1,2,3,4,5])).to be true
    expect(result_include_group(result, [1,2,3])).to be false
    expect(result_include_group(result, [4,5])).to be false
  end

  it "should not group unfused rods together" do
    result = group_fused_rods(5, ["1 2 3", "4 5"])
    expect(result_include_group(result, [1,2,3,4,5])).to be false
    expect(result_include_group(result, [1,2,3])).to be true
    expect(result_include_group(result, [4,5])).to be true
  end

  it "should make disparate rods into its own group" do
    result = group_fused_rods(4, ["1 2", "1 4"])
    expect(result_include_group(result, [1,2,4])).to be true
    expect(result_include_group(result, [3])).to be true
  end
end

describe "min_cost function" do
  it "should calculate cost" do
    expect(min_cost(4, ["1 2", "1 4"])).to eq(3)
    expect(min_cost(4, ["1 2", "3 4", "1 4"])).to eq(2)
    expect(min_cost(10, ["1 2", "1 3", "4 5", "6 7", "6 8", "7 9"])).to eq(7)
  end
end


def result_include_group(result, group)
  result.any?{|fused| (fused - group).empty? and (group - fused).empty?}
end
