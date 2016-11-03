def calculate(str)
  gstr = str.delete(' ')
  stack = []
  out = []
  ints = '0123456789'
  var = ''
  opers = {"(" => 0, ")" => 1, "+" => 3, "-" => 2, "*" => 4, "/" => 5, "^" => 6 }

 # transform
  gstr.each_char do |sym|
    if ints.include? sym
      var.insert var.length, sym
      next
    end
    if var != ''
    out<<var
      var = ''
    end
    if sym == opers.key(0)
      stack << sym
      next
    end

    if sym == opers.key(1)
      while stack.last != opers.key(0)
        out << stack.pop
      end
      stack.pop
      next
    end

if opers.has_key? sym
while opers[sym].to_i < opers[stack.last].to_i
out << stack.pop
end
  stack << sym
  next
end

  end
  if var != ''
    out<<var
    var = ''
  end
  while stack.empty? == false
  out << stack.pop
  end
puts out.to_s
  #calculate
#while out.length != 1
  i = 0
  while out.size != 1

    if opers.has_key? out[i]
      if i-2 < 0
        puts out
        out[i-1..i] = 0.send(out[i], out[i-1])
        puts out
        break
      end
      out[i-2..i] = out[i-2].to_f.send(out[i], out[i-1].to_f)
      i = 0
    end
    i+=1
  end
  #out.each_with_index do |s, i|
  #  if opers.has_key? s
  #    out[i-2..i] = out[i-2].to_f.send(s, out[i-1].to_f)
  #puts out.to_s
  #    i = 0
  #  end

  #end
  return out[0].to_f

  end

