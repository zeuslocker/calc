def calculate(str)
  ints = '0123456789'
  pm = '+-'
  gstr = str.delete(' ')
  while gstr.index('(') do
    gstr.tr(gstr[gstr.index('(')..gstr.index(')')], calculate(gstr[gstr.index('(')..gstr.index(')')]).to_s)
  end

while gstr.index('*') do
ind = gstr.index('*')

left = ''
right = ''

  while ints.include?(gstr[ind-=1]) && ind>=0 do
    left.insert(0, gstr[ind])

  end

  if pm.include?(gstr[ind]) && !(left.equal?('')) && ind>=0
    left.insert(0, gstr[ind])
  end
puts 'left: '+left
ind = gstr.index('*')
puts 'act: '+gstr[ind]
while ind< (gstr.length-1) && ints.include?(gstr[ind+=1]) do
  puts 'right: '+gstr[ind]
  puts ind
  puts  gstr.length
  right.insert(0, gstr[ind])
end
puts right+'f'
if pm.include?(gstr[ind]) && !(right.equal?(''))
  right.insert(0, gstr[ind])
end
  return left.to_i * right.to_i
end
end

