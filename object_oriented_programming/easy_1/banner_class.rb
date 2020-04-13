# Banner Class
# Behold this incomplete class for constructing boxed banners.

class Banner
  def initialize(message, width=nil)
    @message = message
    natural_width = @message.size + 2
    if width && width > natural_width 
      @width = width
    else
      @width = natural_width
    end
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line,
      horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    "+" + ("-" * @width) + "+"
  end

  def empty_line
    "|" + (" " * @width) + "|"
  end

  def message_line
    "|" + @message.center(@width) + "|"
  end
end
# Complete this class so that the test cases shown below work as
# intended. You are free to add any methods or instance variables you
# need. However, do not make the implementation details public.

# You may assume that the input will always fit in your terminal window.

# Test Cases
puts ""
banner = Banner.new('To boldly go where no one has gone before.')
puts banner
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+
banner2 = Banner.new('')
puts banner2
# +--+
# |  |
# |  |
# |  |
# +--+

# Further Exploration
# Modify this class so new will optionally let you specify a fixed
# banner width at the time the Banner object is created. The message in
# the banner should be centered within the banner of that width. Decide
# for yourself how you want to handle widths that are either too narrow
# or too wide.
