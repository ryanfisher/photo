Photo Hosting App
===

Setting up the development environment
---

Running tests
---
The default rake task is set up to run specs and other metrics
```ruby
bundle exec rake
```

Linux system dependencies
---
Postrgres dependencies:
sudo apt-get install libpq-dev postgresql-9.3 postgresql-contrib-9.3 imagemagick

Deploying the app
---
- Install system dependencies
- Add database.yml and secrets.yml to capistrano shared/config folder
- Set up environment variables

Additional resources and inspirations
---
The best way to organize a lifetime of photos https://news.ycombinator.com/item?id=9426422
https://www.thislife.com/
