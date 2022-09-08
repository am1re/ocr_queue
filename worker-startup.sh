#!/usr/bin/with-contenv sh
cd $CWD

TEST_URL="${RABBIT_ALIVE_TEST_URL:='http://guest:guest@localhost:15672/api/aliveness-test/%2F'}"

until [ \
  "$(curl -s -w '%{http_code}' -o /dev/null $TEST_URL)" \
  -eq 200 ]
do
  echo "[worker-startup.sh] Retrying aliveness test on RabbitMQ ..."
  sleep 5
done

bundle exec rake sneakers:run

