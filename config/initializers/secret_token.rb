# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
require 'securerandom'

def secure_token
	token_file = Rails.root.join('.secret')
	if File.exist?(token_file)
		File.read(token_file).chomp
	else
		token = SecureRandom.hex(64)
		File.write(token_file,token)
		token
	end
end

SampleApp::Application.config.secret_key_base = secure_token

#SampleApp::Application.config.secret_key_base = '2f8acffe701fed63a195f56fb4afb4e71c30364757d52a97101e8f591de52069b82c369982c5412a608a15f1698122f20e783c2230c6e6ddd9a76214e07651ef'
