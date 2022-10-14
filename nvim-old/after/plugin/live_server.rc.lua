local status, live_server = pcall(require, 'live_server')
if (not status) then return end

live_server.setup({
  port = 8080,
  browser_command = "", -- empty string starts up with the default browswer
  quiet = false,
  no_css_inject = false, -- Disables css injections if true, might be useful when testing out tailwind css
})
