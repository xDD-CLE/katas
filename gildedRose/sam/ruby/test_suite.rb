Dir['test/**/*_tests.rb'].each do |test|
  require_relative test
end
