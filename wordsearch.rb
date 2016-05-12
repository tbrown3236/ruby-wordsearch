############################################################
#
#   Name:  Terry Brown
#  Assignment:  wordsearch Final
#  Date:        6/11/2015
#  Class:       CIS 283
#  Description: solve puzzle
#
############################################################

class Puzzle
  attr_reader :words

  def initialize

    @cells = []
    @dir = [
        [-1, 0],
        [1, 0],
        [0, 1],
        [0, -1],
        [-1, 1],
        [1, -1],
        [1, 1],
        [-1, -1]
    ]
    45.times do
      row = []
      45.times do
        row << "."
      end
      @cells << row
    end
    @words = []
    test_file = File.open("words.txt",)
    while !test_file.eof?
      line = test_file.gets.chomp.upcase.gsub(" ", '')
      @words<<line
    end
    @words.sort_by! { |size| size.length }.reverse!
    test_file.close
  end

  def print_grid
    grid = ""
    @cells.each do |row|
      grid +=row.join(" ")+ "\n"
    end
    return grid
  end

  def write_words

    @words.each do |word|
      @direction = @dir[rand(0..@dir.length - 1)]

      row = rand(0..44)
      col = rand(0..44)
      while !check_if(col, row, word)
        @direction = @dir[rand(0..@dir.length - 1)]
        row = rand(0..44)
        col = rand(0..44)

      end

      word.each_char do |letter|
        @cells[row][col] = letter
        row += @direction[0]
        col += @direction[1]
      end
    end
    return random_letters
  end


  def check_if(c, r, word)

    row = r
    col = c

    @place = true
    word.each_char do |letter|

      if (row >=0 && col >=0 && row < 45 && col < 45 && ((@cells[row][col] == ".") || (@cells[row][col] == letter)))
        row += @direction[0]
        col += @direction[1]
      else
        @place = false

      end
    end
    return @place
  end

  def random_letters
    random = ''
    a = @words.join("")
    row = 0
    while row < @cells.length
      col = 0
      while col < @cells[row].length
        if @cells[row][col] == "."
          random << a[rand(0..a.length - 1)]
        else
          random << @cells[row][col]
        end
        random += ' '
        col += 1
      end
      random += "\n"
      row += 1
    end
    return random
  end

  def solve_key

    @words.each do |word|
      @direction = @dir[rand(0..@dir.length - 1)]

      row = rand(0..44)
      col = rand(0..44)
      while !check_if(col, row, word)
        @direction = @dir[rand(0..@dir.length - 1)]
        row = rand(0..44)
        col = rand(0..44)

      end

      word.each_char do |letter|
        @cells[row][col] = letter
        row += @direction[0]
        col += @direction[1]
      end
    end
  end

  def print_key
    result = ""

    @words.sort.join("\n")
    @words.sort.each_slice(3).each do |line|
      result += line[0].ljust (90 / 3)
      result += line[1].ljust (90 / 3)
      result += line[2].ljust (90 / 3)
      result += "\n"
    end

    return result
  end
end
