web: rm -f tmp/pids/server.pid && bundle exec rails s puma -p 80 -b 0.0.0.0
que: rm -f tmp/pids/sidekiq.pid && bundle exec rake que:work
