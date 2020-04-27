# # Roman Numerals

# The Romans were a clever bunch. They conquered most of Europe and ruled it for hundreds of years. They invented concrete and straight roads and even bikinis. One thing they never discovered though was the number zero. This made writing and dating extensive histories of their exploits slightly more challenging, but the system of numbers they came up with is still in use today. For example the BBC uses Roman numerals to date their programmes.

# The Romans wrote numbers using letters - I, V, X, L, C, D, M. (notice these letters have lots of straight lines and are hence easy to hack into stone tablets).

# Write a function to convert from normal numbers to Roman Numerals: e.g.

# ```
#  1  => I
# 10  => X
#  7  => VII
# ```

# There is no need to be able to convert numbers larger than about 3000. (The Romans themselves didn't tend to go any higher)

# Wikipedia says: Modern Roman numerals ... are written by expressing each digit separately starting with the left most digit and skipping any digit with a value of zero.

# To see this in practice, consider the example of 1990.

# In Roman numerals 1990 is MCMXC:

# 1000=M
# 900=CM
# 90=XC

# 2008 is written as MMVIII:

# 2000=MM
# 8=VIII

# See also: http:,www.novaroma.org,via_to_romana,numbers.html

require_relative '../../../lib/ext/date_extensions'

RSpec.configure do |config|
  # Use color in STDOUT
  config.color_enabled = true

  # Use color not only in STDOUT but also in pagers and files
  config.tty = true

  # Use the specified formatter
  config.formatter = :documentation # :progress, :html, :textmate
end

describe Date, '#to_roman' do

  it 'converts MMXX,IV,XIV' do
    Date.new(2020, 04, 14).to_roman.should eq 'MMXX,IV,XIV'
  end

  it 'converts MMXX,III,XXVI' do
    Date.new(2020, 03, 26).to_roman.should eq 'MMXX,III,XXVI'
  end

  it 'converts MMXX,X,I' do
    Date.new(2020, 10, 01).to_roman.should eq 'MMXX,X,I'
  end

  it 'converts MMXX,III,XXVIII' do
    Date.new(2020, 03, 28).to_roman.should eq 'MMXX,III,XXVIII'
  end

  it 'converts MMXX,I,XXVI' do
    Date.new(2020, 01, 26).to_roman.should eq 'MMXX,I,XXVI'
  end

  it 'converts MMXX,IX,XX' do
    Date.new(2020, 09, 20).to_roman.should eq 'MMXX,IX,XX'
  end
end