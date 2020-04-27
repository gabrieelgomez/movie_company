# frozen_string_literal: true

# Date class extensions
class Date
  def to_roman
    [year.roman, month.roman, day.roman].join('/')
  end
end
