type netlifyEvent = {
  body: option<string>,
  isBase64Encoded: bool,
}

type netlifyContext = {thing: string}

type netlifyResponse = {
  body: string,
  headers: Js.Dict.t<string>,
  statusCode: int,
}

let netlifyResponse = (statusCode, body: string) => {
  statusCode: statusCode,
  headers: Js.Dict.fromArray([("content-type", "application/json")]),
  body: Js.Json.stringify(Js.Json.string(body)),
}

let handler = (event: netlifyEvent, context: netlifyContext): netlifyResponse => {
  let body = event.body

  let response = switch body {
  | Some(body) => netlifyResponse(200, body)
  | None => netlifyResponse(501, "Empty request body.")
  }
  response
}
