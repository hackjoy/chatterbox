# GET home page.
exports.index = (req, res) ->
    res.render 'index', {
        title: 'Chatterbox',
    }

# POST home page - not yet implemented
exports.login = (req, res) ->
    # log user in
    res.redirect('/chat')
    res.end()
