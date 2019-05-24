def bad_list(ar)
  min=ar[0]
  (0...ar.length).each do |i|
    (i...ar.length).each do |j|
      if ar[i]> ar[j] || ar[j]< min
        min=ar[j]
      end
    end
  end
  min
end
def better_list(ar)
  min=ar[0]
  ar.each do |el|
    if el < min
      min=el
    end
  end
  min
end
#ar=[99,1,3,-1,0]
# p better_list(ar)
def horrible_sub_array(ar)
  max=0
  (0...ar.length).each do |i|
    (i...ar.length).each do |j|
      cur=ar[i..j]
      cur=cur.reduce(&:+)
      if cur> max
        max=cur
      end
    end
  end
  max
end
list = [2, 3, -6, 7, -6, 7]
p horrible_sub_array(list)

#def better_version(arr)
#  largest_sum = 0
#  current_sum = 0
#
#  arr.each_with_index do |el, idx|
#    if arr[idx]
#    end
#  end
#end

def bad_ana(str1,str2)
  str1.split("").permutation.to_a.index(str2.split(""))!=nil 
end

#p "word".split("").permutation.to_a
#w1="word"
#w2="dorw"
#w3="2"
#p bad_ana(w1,w2)

def bad_ana_2(str1,str2)
  str1=str1.split("")
  str2=str2.split("")
  str1.each_with_index do |el,idx|
    found_index=str2.index(el)
    if found_index
      str2.delete_at(found_index) 
    end
  end
  str2.empty? 
end

def third_ana(str1,str2)
  str1.split("").sort==str2.split("").sort
end

def fourth_ana(str1,str2)
  hstr1=Hash.new(0)
  hstr2=Hash.new(0)
  str1.split("").each{|el|hstr1[el]+=1}
  str2.split("").each{|el|hstr2[el]+=1}
  p hstr1,hstr2
  hstr1==hstr2 
end



def bonus_ana(str1,str2)
  hstr1=Hash.new(0)
  str1.split("").each{|el|hstr1[el]+=1}
  str2.split("").each do |el|
    if hstr1[el]
      hstr1[el]-=1
    end
  end
  p hstr1
  hstr1.values.all?{|el|el==0} 
end
w1="word"
w2="notaword"
w3="2"
p bonus_ana(w1,w2)

def perm(ar)
  return ar if ar.length <=1
  ret=[]
  (0...ar.length).each do |i|
    #holder=[]
    #holder << ar[i]
  #  perm(ar[0...i]+ar[i+1..-1]).each do |el|
  #    p "this is holder #{holder} this is el: #{el}"
  #    holder << el
  #  end
    #ret << ar[i]
    #ret +=[perm(ar[0...i]+ar[i+1..-1])]
    ret<<[[ar[i]] + perm(ar[0...i]+ar[i+1..-1])]
    #ret << holder
  end
  ret 
end

def permutation_one(string)
  return [string] if string.size < 2
  ch = string[0]
  permutation_one(string[1..-1]).each_with_object([]) do |perm, result|
    (0..perm.size).each { |i| result << perm.dup.insert(i,ch) }
  end
end

def permutation_one(string)
  return [string] if string.size < 2
  ch = string[0]
  permutation_one(string[1..-1]).each_with_object([]) do |perm, result|
    (0..perm.size).each { |i| result << perm.dup.insert(i,ch) }
  end
end
p perm(["a","b","c","d","e","f"])
#p ["a","b","c"].permutation.to_a
#p permutation_one("abc")

def two_sum?(arr, target_sum)
  my_hash = {}
  final_arr = []

  arr.each_with_index do |el, idx|
    if my_hash[el]
      final_arr = [my_hash[el], idx]
    else
      my_hash [target - el] = idx
    end
  end
  final_arr
end



def two_sum?(arr, target_sum)
#   pairs = []

  