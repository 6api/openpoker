# Genesis Texas hold'em Game Server & Client
#### This project is based on [wagerlabs/openpoker](https://github.com/wagerlabs/openpoker), but I modified almost all of the code:

- Except distributed, I do not care about this.
- Except object paramters from exch module.
- Delete super big module g.
- Delete db dirty operation and use mnesia transaction.
- Reflection all texas module and game module, game context struct.
- Less protocol and client communications.

#### I added some feature:

- HTML5 texas client, animate by CSS3, communicate by websocket API, NOT Flash!!!
- Websocket communition layer based mochisocket.
- Client simulator, can be based process message testing.
- Manage Site based ChicagoBoss MVC Web Framework.
- Script tools generate protocol code by need to change.

# License

Genesis is released under a Creative Commons NonCommercial Licence.

------------------------------------------

My English is not very good, but I very much offort trying.
