cron = require('cron').CronJob

module.exports = (robot) ->
  robot.hear /I am (.*)/i, (msg) ->
	msg.send "Hi, #{msg.match[1]}"
	
  robot.respond /omikuji/i, (msg) ->
    msg.send msg.random ["大吉", "中吉", "小吉"]
	
  robot.respond /(?:new|add) geojob (.*) (.*), (msg) ->
    new cron msg.match[1], () =>
	  request = robot.http("https://maps.googleapis.com/maps/api/geocode/json")
	                 .query(address: msg.match[2])
					 .get()
	  request (err, res, body) ->
	    json = JSON.parse body
		location = json['result'][0]['geometry']['location']
		
		msg.send "#{location['lat']}, #{location['lng']}"
	, null, true, "Asia/Tokyo"
	msg.send "GeoJob created"