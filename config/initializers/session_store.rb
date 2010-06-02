# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_sampleapp5_session',
  :secret      => '2bfa0c8112d5a438033a3fb8e940ba77396a42e4471c7caac5d46c4c0629015aa392875728fa3218931731a36b4158e1ef4f1927e902005f2847279bb2310d6e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
