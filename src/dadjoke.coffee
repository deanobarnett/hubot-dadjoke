module.exports = (robot) ->
  robot.respond /dadjoke me/i, (msg) ->
    jokeIndex = Math.floor((Math.random() * 25))
    msg.http("https://www.reddit.com/r/dadjokes.json?sort=top").get() (err, res, body) ->
      response = JSON.parse(body).data.children[jokeIndex].data

      msg.send response.title
      msg.send response.selftext
