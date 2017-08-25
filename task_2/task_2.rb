def min_cost(n, pairs)
  fused_rods = group_fused_rods(n, pairs)
  cost = 0
  fused_rods.each do |set|
    cost += Math.sqrt(set.size).ceil
  end
  cost
end

#group all direct and indirectly fused rods into arrays
def group_fused_rods(n, pairs)
  fused_rods = []
  pairs.each do |pair|
    rods_in_pair = pair.scan(/\d+/).map{|i| i.to_i}
    if both_new(fused_rods, rods_in_pair)
      containing_groups = groups_with_either_rod(fused_rods, rods_in_pair)
      if containing_groups.size == 2 #if each element of the pair exists in a seperate group, combine the two groups
        combine_groups(fused_rods, containing_groups)
      elsif containing_groups.size == 1  #only one element in the pair is within a group, add the new element into the group
        add_new_rod_to_group(fused_rods, containing_groups, rods_in_pair)
      else
        fused_rods.push(rods_in_pair)
      end
    end
  end
  n.times do |i|
    fused_rods.push([i+1]) if !fused_rods.flatten.include?(i+1)
  end
  fused_rods
end

#check no any existing groups includes the complete pair
def both_new(fused_rods, rods_in_pair)
  fused_rods.none?{ |fused| (rods_in_pair - fused).empty? }
end

#select groups that contain either element of the pair
def groups_with_either_rod(fused_rods, rods_in_pair)
  containing_groups = []
  fused_rods.each do |fused|
     if fused.include?(rods_in_pair[0]) or fused.include?(rods_in_pair[1])
       containing_groups.push(fused)
     end
  end
  containing_groups
end

def combine_groups(fused_rods, containing_groups)
  fused_rods.push(containing_groups[0] + containing_groups[1])
  fused_rods.delete(containing_groups[0])
  fused_rods.delete(containing_groups[1])
end

def add_new_rod_to_group(fused_rods, containing_groups, rods_in_pair)
  fused_rods.delete(containing_groups[0])
  fused_rods.push((containing_groups[0] + rods_in_pair).uniq)
end

min_cost(11, ["1 2","1 3", "4 5", "6 7", "7 8"])
