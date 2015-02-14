module.exports = (robot) ->
  robot.hear /I am (.*)/i, (msg) ->
	  msg.send "Hi, #{msg.match[1]}"
	
  robot.respond /omikuji/i, (msg) ->
    msg.send msg.random ["大吉", "中吉", "小吉"]