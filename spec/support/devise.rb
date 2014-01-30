RSpec.configure do |config|
  config.include Devise::TestHelpers, :type => :controller
end
RSpec.configure do |config|
  config.mock_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end