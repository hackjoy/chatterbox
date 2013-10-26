
stored_messages = []

# GET home page.
exports.index = (req, res) ->
    res.render 'index', {
        title: 'Chatterbox',
        messages: stored_messages
    }
    console.log(stored_messages)

# POST home page
exports.login = (req, res) ->
    date = new Date()
    stored_messages.push({"date": "#{date.getHours()}:#{date.getMinutes()}", "message": req.body.message})
    res.redirect('/')
    res.end()
