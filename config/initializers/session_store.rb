# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_almacen_session',
  :secret      => '09480bd0f937524d605edc1661ce6b58d80ea5a7a1b8c406b48b75e14c24bfc947790cf0e10d828d8a519b970b9bede622146ba037c1b0dec7d6be234bfa7578'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
