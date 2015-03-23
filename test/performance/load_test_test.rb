require 'test_helper'
require 'rails/performance_test_help'

class LoadTestTest < ActionDispatch::PerformanceTest
  # Refer to the documentation for all available options
  # self.profile_options = { runs: 5, metrics: [:wall_time, :memory],
  #                          output: 'tmp/performance', formats: [:flat] }

    test "Generate 1000 Users" do
  	for i in 0..1000	
  		post '/users/new', params: { slug: Faker::Internet.user_name, name:Faker::Name.name, 
  			email:Faker::Internet.email, password:'password1', password_confirmation:'password1', 
  			commit:'Sign up' }
  	end
  end

end
