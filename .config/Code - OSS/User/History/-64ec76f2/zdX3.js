const time = Variable('', {
    poll: [1000, function() {
        return Date().toString()
    }],
})

import Bar from "./widgets/statusbar"

App.config({
    windows: [Bar(1)],
})