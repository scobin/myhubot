#!/bin/bash

export HUBOT_SLACK_TOKEN="xoxb-3684538542-PghxYh7qXORzSeqoljBxJtEj"
#bin/hubot --adapter slack
forever start -c coffee node_modules/.bin/hubot --adapter slack
