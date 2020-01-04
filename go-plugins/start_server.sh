#!/bin/bash

# Start the first process
cd /usr/local/kong/
./go-pluginserver -socket /usr/local/kong/go_pluginserver.sock -plugins-directory /kong.conf.d &
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start my_first_process: $status"
  exit $status
fi
ls -la /usr/local/kong
sudo chmod 777 -R /usr/local/kong
kong restart --vv