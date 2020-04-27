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

# See also: http://www.novaroma.org/via_romana/numbers.html

require_relative '../../../lib/ext/integer_extensions'

RSpec.configure do |config|
  # Use color in STDOUT
  config.color_enabled = true

  # Use color not only in STDOUT but also in pagers and files
  config.tty = true

  # Use the specified formatter
  config.formatter = :documentation # :progress, :html, :textmate
end

describe Integer, '#roman' do

  it 'converts 1' do
    1.roman.should eq 'I'
  end

  it 'converts 2' do
    2.roman.should eq 'II'
  end

  it 'converts 3' do
    3.roman.should eq 'III'
  end

  it 'converts 4' do
    4.roman.should eq 'IV'
  end

  it 'converts 5' do
    5.roman.should eq 'V'
  end

  it 'converts 6' do
    6.roman.should eq 'VI'
  end

  it 'converts 9' do
    9.roman.should eq 'IX'
  end

  it 'converts 27' do
    27.roman.should eq 'XXVII'
  end

  it 'converts 48' do
    48.roman.should eq 'XLVIII'
  end

  it 'converts 59' do
    59.roman.should eq 'LIX'
  end

  it 'converts 93' do
    93.roman.should eq 'XCIII'
  end

  it 'converts 141' do
    141.roman.should eq 'CXLI'
  end

  it 'converts 163' do
    163.roman.should eq 'CLXIII'
  end

  it 'converts 402' do
    402.roman.should eq 'CDII'
  end

  it 'converts 575' do
    575.roman.should eq 'DLXXV'
  end

  it 'converts 911' do
    911.roman.should eq 'CMXI'
  end

  it 'converts 1001' do
    1001.roman.should eq 'MI'
  end

  it 'converts 1024' do
    1024.roman.should eq 'MXXIV'
  end

  it 'converts 1464' do
    1464.roman.should eq 'MCDLXIV'
  end

  it 'converts 1989' do
    1989.roman.should eq 'MCMLXXXIX'
  end

  it 'converts 1998' do
    1998.roman.should eq 'MCMXCVIII'
  end

  it 'converts 3000' do
    3000.roman.should eq 'MMM'
  end

  it 'converts 4999' do
    4999.roman.should eq 'MMMMCMXCIX'
  end
end