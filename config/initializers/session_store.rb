# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_sofo_session',
  :secret      => 'c98340cad1c0ce629fa14bec65dd99241be70204a98c011a2456e45b9dfe8d97f53a58ddce81d2580442a3ceefbecd1495447b344511aaf46268cf1cd5f60bb7'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
