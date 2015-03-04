cron = require('cron').CronJob
HttpClient = require 'scoped-http-client'
GetGeoCode = (msg, location) ->
  request = HttpClient.create("https://maps.googleapis.com/maps/api/geocode/json")
                 .query(address: location)
                 .get()
  request (err, res, body) ->
      json = JSON.parse body
      location = json['results'][0]['geometry']['location']
      msg.send "#{location['lat']}, #{location['lng']}"

module.exports = (robot) ->
  robot.hear /I am (.*)/i, (msg) ->
    msg.send "Hi, #{msg.match[1]}"

  robot.respond /omikuji/i, (msg) ->
    msg.send msg.random ["大吉", "中吉", "小吉"]

  robot.respond /(?:new|add) geojob (.*) (.*)/i, (msg) ->
    @location = msg.match[2]
    @msg = msg
    new cron msg.match[1], () =>
      GetGeoCode @msg, @location
    , null, true, "Asia/Tokyo"
    msg.send "GeoJob created"