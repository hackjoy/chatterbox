
stored_messages = []

# GET chat page
exports.index = (req, res) ->
    res.render 'chat', {
        title: 'Chatterbox',
        messages: stored_messages
    }

# POST chat page - create a new message
exports.create = (req, res) ->
    date = new Date()
    stored_messages.push({"date": "#{date.getHours()}:#{date.getMinutes()}", "message": req.body.message})
    res.redirect('/chat')
    res.end()
