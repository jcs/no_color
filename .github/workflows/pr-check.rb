#!/usr/bin/env ruby

require "tempfile"

STATES = [
  :header,
  :libraries,
  :header_2,
  :software,
  :header_3,
  :non_believers,
]

DIFF_LINE_LEN = 80

def next_state(state)
  STATES[STATES.index(state) + 1]
end

def sort_and_check(arr, label)
  sorted = arr.sort_by{|l| l.scan(/^\| \[([^\]]+)\]/).first.first.downcase }

  if arr == sorted
    return true
  end

  puts "", "#{label} lines are not sorted:", ""

  t = Tempfile.new("as-is")
  t.write arr.map{|l| l[0, DIFF_LINE_LEN] }.join("\n")
  t.close

  t2 = Tempfile.new("sorted")
  t2.write sorted.map{|l| l[0, DIFF_LINE_LEN] }.join("\n")
  t2.close

  system("diff", "-ud", t.path, t2.path)

  t.unlink
  t2.unlink

  return false
end

File.open("index.md") do |f|
  state = :header
  libraries = []
  software = []
  non_believers = []
  lc = 0

  while f && !f.eof?
    line = f.gets.strip
    lc += 1

    case state
    when :header, :header_2
      if line.match(/^\|:-\|:-\|:-/)
        state = next_state(state)
      end
    when :libraries, :software, :non_believers
      if line.match(/^\{: rules/)
        state = next_state(state)
      else
        if !line.match(/^\| [^\|]+ \| [^\|]+ \| [^\|]+ \|$/)
          puts "Line #{lc} does not match format | | |:", line
        end

        case state
        when :libraries
          libraries.push line
        when :software
          software.push line
        when :non_believers
          non_believers.push line
        else
          raise "bogus state?"
        end
      end
    end
  end

  fails = false
  fails |= !sort_and_check(libraries, "Library")
  fails |= !sort_and_check(software, "Software")
  fails |= !sort_and_check(non_believers, "Non-supporting software")

  if fails
    exit 1
  end
end

exit 0
