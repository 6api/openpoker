-module(genesis_protocol).
-export([connect/0, disconnect/1, handle_message/2, handle_data/2]).

-include("genesis.hrl").

connect() -> console(genesis_protocol_connect).
disconnect(_) -> console(genesis_protocol_disconnect).
handle_message(Msg, _LoopData) -> console([genesis_protocol_msg, Msg]).

handle_data(Data, _LoopData) when is_list(Data) ->
  Bin = base64:decode(list_to_binary(Data)),
  console([handle_data, Bin]),
  Result = protocol:read(Bin),
  console([handle_protocol, Result]),

  case Result of
    {'EXIT', {Reason, Stack}} ->
      ?LOG([{handle_data_error, {Reason, Stack}}]),
      send(#notify_error{error = ?ERR_DATA}),
      webtekcos:close();
    R ->
      console([handle_data_read, R]),
      send(R)
  end.

console(R) ->
  io:format("===> ~p~n", [R]).

send(R) ->
  Bin = list_to_binary(protocol:write(R)),
  Encode = base64:encode(Bin),
  webtekcos:send_data(Encode).