require "./lichess/*"
require "imgcat"

Imgcat.cat(IO::Memory.new(Lichess::Puzzle.daily), STDOUT)
