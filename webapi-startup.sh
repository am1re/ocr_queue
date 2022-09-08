#!/usr/bin/with-contenv sh
cd $CWD
rm -f /myapp/tmp/pids/server.pid
bundle exec rails s -p 3000 -b '0.0.0.0'
