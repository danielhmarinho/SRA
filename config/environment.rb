# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
SRA::Application.initialize!

Time::DATE_FORMATS[:data] = "posted on %b, %m %Y - %I:%M%p"