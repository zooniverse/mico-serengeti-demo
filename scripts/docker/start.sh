#!/bin/bash -ex

cd /rails_app

if [ -d "/rails_conf/" ]
then
    ln -sf /rails_conf/* ./config/
fi

mkdir -p tmp/pids/
rm -f tmp/pids/*.pid

bundle exec rake db:migrate

if [ "$RAILS_ENV" == "development" ]; then
  exec foreman start
else
  if [ ! -d public/assets ]
  then
      bundle exec rake assets:precompile
  fi

  TERM=xterm git log --format="%H" -n 1 > public/commit_id.txt
  exec /usr/bin/supervisord -c /etc/supervisor/supervisord.conf
fi
