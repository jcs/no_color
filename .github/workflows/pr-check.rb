#!/usr/bin/env ruby

require "tempfile"

STATES = [
  :header,
  :libraries,
  :header_2,
  :software,
  :header_3,
  :non_believers,
  :trailer,
]

DIFF_LINE_LEN = 80

def next_state(state)
  STATES[STATES.index(state) + 1]
end

def sort_and_check(arr, label)
  begin
    sorted = arr.sort_by.with_index{|l,i|
      [ l.scan(/^\| \[([^\]]+)\]/).first.first.downcase, i ]
    }
  rescue => e
    return false
  end

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

  system("diff", "-U1", "-d", t.path, t2.path)

  t.unlink
  t2.unlink

  return false
end

File.open("index.md") do |f|
  state = :header
  groups = { :libraries => [], :software => [], :non_believers => [] }
  lc = 0
  fails = false

  while f && !f.eof?
    line = f.gets.gsub(/\n\z/, "")
    lc += 1
    descr = nil

    case state
    when :header, :header_2, :header_3
      if line.match(/^\|:-\|:-/)
        state = next_state(state)
      end
    when :libraries, :software, :non_believers
      if line.match(/^\{: rules/)
        state = next_state(state)
      elsif line.strip != line
        puts "Line #{lc} has leading or trailing whitespace: #{line.inspect}"
        fails = true
      else
        parts = []
        if m = line.match(/^\| (.+) \|$/)
          parts = m[1].split(/ \| /).flatten
        end

        if state == :non_believers
          if parts.count != 2
            puts "Line #{lc} does not match format | |", line
            fails = true
          end
        elsif state == :libraries
          if parts.count == 4
            descr = parts[2]
          else
            puts "Line #{lc} does not match format | | | |", line
            fails = true
          end
        elsif state == :software
          if parts.count == 3
            descr = parts[1]
          else
            puts "Line #{lc} does not match format | | |", line
            fails = true
          end
        else
          raise "invalid state #{state}"
        end

        if descr.to_s.match(/[.!]$/)
          puts "Line #{lc} description has trailing punctuation", line
          fails = true
        end

        groups[state].push line
      end
    when :trailer
      puts "Trailing junk at the end of the file on line #{lc}: #{line.inspect}"
      fails = true
    end
  end

  fails |= !sort_and_check(groups[:libraries], "Library")
  fails |= !sort_and_check(groups[:software], "Software")
  fails |= !sort_and_check(groups[:non_believers], "Non-supporting software")

  if fails
    exit 1
  end
end

exit 0
