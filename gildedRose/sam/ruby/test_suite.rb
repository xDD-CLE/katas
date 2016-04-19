Dir['test/**/*_tests.rb'].each { |testCase| system("ruby #{testCase}") }
