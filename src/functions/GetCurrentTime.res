open HandlerTypes

let handler = (event: netlifyEvent, context: netlifyContext): netlifyResponse => {
  let body = event.body

  let response = switch body {
  | Some(body) => netlifyResponse(200, body)
  | None => netlifyResponse(501, "Empty request body.")
  }
  response
}
