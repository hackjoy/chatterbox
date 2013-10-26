# GET about page

exports.about = (req, res) ->
    res.render 'about', {
        title: 'About'}