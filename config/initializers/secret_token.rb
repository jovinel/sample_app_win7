# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
#SampleAppWin7::Application.config.secret_key_base = 'a2f242931e13d6c39554430b6963dd68c24d999c0236fa8752d0d0ae29cadb5538ba89a2bf77d648423e6bc2b4c7f18c05de100baeffaf7afeef1ad224434f9e'
require 'securerandom'

def secure_token
	token_file = Rails.root.join('.secret')
	if File.exist?(token_file)
		#Use the existing token.
		File.read(token_file).chomp
	else
		# Generate a new token and store it in token_file.
		token = SecureRandom.hex(64)
		File.write(token_file, token)
		token
	end
end

SampleAppWin7::Application.config.secret_key_base = secure_token