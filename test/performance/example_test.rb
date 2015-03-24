require 'test_helper'
#require File.dirname(__FILE__) + '/../test_helper'
require 'rails/performance_test_help'

class ExampleTest < ActionDispatch::PerformanceTest
  # Refer to the documentation for all available options
  # self.profile_options = { runs: 5, metrics: [:wall_time, :memory],
  #                          output: 'tmp/performance', formats: [:flat] }

  test "user came to home page" do
    get '/'
  end

  test "user clicked login" do
  	get '/login'
  end

end
