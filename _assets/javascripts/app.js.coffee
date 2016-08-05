# Add JavaScript required for your app (will be compressed together).
#= require highlightjs
#= require gist-async
#= require what-input
#= require picturefill
#= require foundation-sites/dist/foundation

'use strict'

# Invoke Foundation.
$(document).foundation()

# Invoke highlight.js on page load.
hljs.initHighlightingOnLoad()
