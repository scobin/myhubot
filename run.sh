#!/bin/bash

export HUBOT_SLACK_TOKEN="xoxb-3686755251-W39TN03LQYt8B3Pt5kQYXyIj"
bin/hubot --adapter slack
#forever start -c coffee node_modules/.bin/hubot --adapter slack
