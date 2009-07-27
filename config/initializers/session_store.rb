# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_salon_space_session',
  :secret      => 'ec968e7e845e79b47b81e3f20e6df7589bf5f851ebc2544ac179d8419eb1cb719917430a9f99a5ecdc0cce83f47ccacaeaeae7548c3b51533a8bc3f1be884d87'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
