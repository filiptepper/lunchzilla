# Lunchzilla

Keep your lunches in order.

## Deploying to Heroku

To run Lunchzilla all you need is a basic & free Heroku setup with Cedar stack.

One you setup your OAuth based Github application you need configure Lunchzilla:

    heroku config:add GITHUB_KEY=abcdef
    heroku config:add GITHUB_SECRET=fedcba
    heroku config:add TIME_ZONE='Central Time (US & Canada)'