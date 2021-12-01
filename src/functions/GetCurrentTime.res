module Netlify = {
  type event = {
    body: option<string>,
    isBase64Encoded: bool,
  }

  type context = {thing: string}

  type response = {
    body: string,
    headers: Js.Dict.t<string>,
    statusCode: int,
  }

  let response = (statusCode, body) => {
    statusCode: statusCode,
    headers: Js.Dict.fromArray([("content-type", "application/json")]),
    body: Js.Json.stringify(Js.Json.string(body)),
  }

  type t = (event, context) => response
}

let handler: Netlify.t = (event, context) => {
  let body = event.body

  // add decoder

  Js.log(body)

  let response = switch body {
  | Some(body) => Netlify.response(200, body)
  | None => Netlify.response(501, "Empty request body.")
  }
  response
}
