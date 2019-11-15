# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
    user_name: 'cad.event.genie',
    password: 'Event@12345',
    domain: 'gmail.com',
    address: 'smtp.gmail.com',
    port: 587,
    authentication: :plain
}
