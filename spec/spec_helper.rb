require 'rspec'

RSpec.configure do |config|
  # Use color in STDOUT

  # Use color not only in STDOUT but also in pagers and files
  config.tty = true

  # Use the specified formatter
  config.formatter = :documentation # :progress, :html, :textmate
end
