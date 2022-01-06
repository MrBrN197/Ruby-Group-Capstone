module Input
  def ask_text(text)
    valid = false
    until valid
      print "Insert #{text}:"
      input = gets.chomp
      valid = true unless input == ''
    end
    input
  end
end
