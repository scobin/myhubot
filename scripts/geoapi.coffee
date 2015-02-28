HttpClient = require 'scoped-http-client'
GetGeoCode = (robot, msg, location) ->
  request = HttpClient.create("https://maps.googleapis.com/maps/api/geocode/json")
                 .query(address: location)
                 .get()
  request (err, res, body) ->
      json = JSON.parse body
      location = json['results'][0]['geometry']['location']
      msg.send "#{location['lat']}, #{location['lng']}"

module.exports = (robot) ->
  robot.hear /location (.*)/, (msg) ->
     GetGeoCode robot, msg, msg.match[1]
