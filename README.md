# Lunchzilla

Keep your lunches in order.

## Deploying to Heroku

To run Lunchzilla all you need is a basic & free Heroku setup with Cedar stack.

One you setup your OAuth based Github application you need configure Lunchzilla:

    heroku config:add GITHUB_KEY=abcdef
    heroku config:add GITHUB_SECRET=fedcba
    heroku config:add TIME_ZONE='Time Zone'
    heroku config:add SECRET_KEY_BASE='secret-key-base'

You might also want to tweak Heroku's environment:

    heroku plugins:install http://github.com/heroku/heroku-labs.git
    heroku labs:enable user_env_compile