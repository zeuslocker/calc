def calculate(str)
  ints = '0123456789'
  fActs = '/*'
  pm = '+-'
  gstr = str.delete(' ')

  while gstr.index('(') do

    gstr.tr(gstr[gstr.index('(')..gstr.index(')')], calculate(gstr[gstr.index('(')..gstr.index(')')]).to_s)
  end
gstr.each_char do |sym|
if fActs.include? sym
  if sym == '*'
    ind = gstr.index('*')
    puts ind
    left = ''
    right = ''
    while ints.include?(gstr[ind-=1]) && ind>=0 do
      left.insert(0, gstr[ind])

    end
    if pm.include?(gstr[ind]) && !(left.equal?('')) && ind>=0
      left.insert(0, gstr[ind])
      leftTr = ind
    else
      leftTr = ind+1
    end

    ind = gstr.index('*')
    while ind< (gstr.length-1) && ints.include?(gstr[ind+=1]) do
      right.insert(right.length, gstr[ind])
    end

    if pm.include?(gstr[ind]) && !(right.equal?(''))
      right.insert(0, gstr[ind])
    end

    if ind < gstr.length-1
      rightTr = ind-1
    else
      rightTr = ind
    end
    puts left

    puts right
    gstr[leftTr..rightTr] = (left.to_i * right.to_i).to_s
  else


    ind = gstr.index('/')
    left = ''
    right = ''
    while ints.include?(gstr[ind-=1]) && ind>=0 do
      left.insert(0, gstr[ind])

    end
    if pm.include?(gstr[ind]) && !(left.equal?('')) && ind>=0
      left.insert(0, gstr[ind])
      leftTr = ind
    else
      leftTr = ind+1
    end

    ind = gstr.index('/')
    while ind< (gstr.length-1) && ints.include?(gstr[ind+=1]) do
      right.insert(right.length, gstr[ind])
    end

    if pm.include?(gstr[ind]) && !(right.equal?(''))
      right.insert(0, gstr[ind])
    end

    if ind < gstr.length-1
      rightTr = ind-1
    else
      rightTr = ind
    end
    puts left
    puts right
    gstr[leftTr..rightTr] = (left.to_i / right.to_i).to_s


  end
end

end

  return gstr.to_i
end

