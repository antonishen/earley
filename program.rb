#!/usr/bin/env ruby

require_relative "lib/earley"

puts Earley.check_string("./files/grammar1.json", "Jen saw Bill through the window")

puts Earley.check_string("./files/grammar2.json", "Jen saw Bill")
