$winners = Array.new

def transpose(ss)
  t = Array.new(ss.size, 0)
  0.upto(ss.size - 1) do |i|
    if ss[i,1].to_i > ss.size
      return false
    end
    0.upto(ss[i,1].to_i - 1) do |j|
      t[j] = t[j] + 1
    end
  end
  return t.join unless t.join == ss
  return false
end

class Munch
  @@num_nexts = 0
  attr_reader :rows, :cols

  def initialize(r, c)
    @rows = r
    @cols = c
    @board = Array.new
    1.upto(r) do
      @board << Array.new(c, "-")
    end
    @rowcount = Array.new(r, 0)
  end

  def print
    @board.each do |r|
      puts r.join("  ")
    end
  end

  def print_rowcount
    puts @rowcount.to_s
  end
  
  def rowcount
    @rowcount.to_s
  end

  def next!
    i = @rows - 1
    while i > 0 and @rowcount[i] == @rowcount[i-1]
      i = i - 1
    end
    if i == 0 and @rowcount[i] == @cols
      return false
    else
      @rowcount[i] = @rowcount[i] + 1
      if i < @rows - 1
        (i+1).upto(@rows - 1) do |r|
          @rowcount[r] = 0
        end
      end
    end
    0.upto(@rows - 1) do |r|
      @board[r] = Array.new(@rowcount[r], "X") + Array.new(@cols - @rowcount[r], "-")
    end
    @@num_nexts = @@num_nexts + 1
  end

  def num_nexts
    @@num_nexts
  end

  def wins?
    0.upto(@rows - 1) do |r|
      0.upto(@cols - 1) do |c|
        if @board[r][c] == "X"
          temp_rowcount = @rowcount.clone
          r.upto(@rows - 1) do |x|
            temp_rowcount[x] = [@rowcount[x], c].min
          end
          return false if $winners.include?(temp_rowcount.join)
        end
      end
    end
    $winners << @rowcount.join
#   $winners << transpose(@rowcount.join) if transpose(@rowcount.join)
    return true
  end

  def moves
    m = String.new
    0.upto(@rows - 1) do |r|
      0.upto(@cols - 1) do |c|
        if @board[r][c] == "X"
          temp_rowcount = @rowcount.clone
          r.upto(@rows - 1) do |x|
            temp_rowcount[x] = [@rowcount[x], c].min
          end
          if $winners.include?(temp_rowcount.join)
            m = m + ',' + (r+1).to_s + (c+1).to_s
          end
        end
      end
    end
    return m
  end
end

a = Munch.new(5, 6)

wins = 1
while a.next! do 
  if a.wins?
    puts "Winning pattern \#" + wins.to_s + "."
    a.print
    puts "\n\n"
    wins = wins + 1
  end
end

#############
#############
#############
#############
#############
=begin
count = 0
while a.next! do
  if a.wins?
    puts a.rowcount
    count = count + 1
  end
end
puts count
=end
  
=begin
while a.next! do
  if a.wins? 
    puts a.rowcount + ','
  else
    puts a.rowcount + a.moves
  end
end
=end

=begin
while a.next! do
  puts "Pattern \#" + a.num_nexts.to_s + "."
  a.print
  if a.wins? 
    puts "No winning moves."
  else
    mm = a.moves
    puts "Winning moves: " + mm[1..-1]
  end
  puts "\n\n"
end
=end

=begin
while a.next! do
  puts a.rowcount if a.wins?
end
=end
#############
#############
#############
#############
#############