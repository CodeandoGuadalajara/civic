local weblit = require('weblit')
local user = require "actors/user"

weblit.app
  .bind({host = "127.0.0.1", port = 1337})

  -- Configure weblit server
  .use(weblit.logger)
  .use(weblit.autoHeaders)

  -- Web Application entrypoint
  .route({path = "/"}, function (req, res)
    res.body = req.method .. " - Welcome to init \n"
    res.code = 200
    res.headers["Content-Type"] = "text/html"
  end)
  .route({path = "/solicitud"}, function (req, res)
    res.body = "[]"
    -- .. req.query.fulltext .. "\n"
    res.code = 200
    res.headers["Content-Type"] = "application/json"
  end)
  .route({path = "/solicitud/:folio"}, function (req, res)
    res.body = req.method .. " - Folio: " .. req.params.folio .. "\n"
    res.code = 200
    res.headers["Content-Type"] = "text/html"
  end)
  .route({path = "/solicitud/:folio/watch"}, function (req, res)
    res.body = '{"message":"success"}'
    res.code = 200
    res.headers["Content-Type"] = "application/json"
  end)
  .route({path = "/solicitud/:folio/stopwatch"}, function (req, res)
    res.body = '{"message":"success"}'
    res.code = 200
    res.headers["Content-Type"] = "application/json"
  end)
  .route({path = "/user"}, function (req, res)
    res.body = '{"message":"' .. user(123) .. '"}\n'
    res.code = 200
    res.headers["Content-Type"] = "application/json"
  end)
  .route({ path = "/:name"}, function (req, res)
    res.body = req.method .. " - " .. req.params.name .. "\n"
    res.code = 200
    res.headers["Content-Type"] = "text/plain"
  end)
  -- Start the server
  .start()
