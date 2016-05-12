############################################################
#
#   Name:  Terry Brown
#  Assignment:  wordsearch Final
#  Date:        6/11/2015
#  Class:       CIS 283
#  Description: solve puzzle
#
############################################################

require_relative 'wordsearch.rb'
require 'prawn'
puz = Puzzle.new
Prawn::Document.generate ("words.pdf") do |pdf|
  pdf.text("Word Search", :align => :center, :size => 24)
  pdf.font "Courier", :size => 10
  (puz.write_words)
  (puz.solve_key)
  pdf.text(puz.random_letters)
  pdf.text("Find the following 45 words:", :align => :center, :size => 14)
  pdf.text" "
  pdf.text(puz.print_key, :align => :center)
  pdf.start_new_page
  pdf.text("Word Search Key", :align => :center, :size => 24)
  pdf.text(puz.print_grid)
  pdf.text("Find the following 45 words:", :align => :center, :size => 14)
  pdf.text" "
  pdf.text(puz.print_key, :align => :center)
end

