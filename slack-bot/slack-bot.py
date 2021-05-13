#!/usr/bin/env python
# Simple slack bot.

import sys
from slacker import Slacker

slack = Slacker('') # your slack-bot token
message = sys.argv[1]
slack.chat.post_message('#general', message);
