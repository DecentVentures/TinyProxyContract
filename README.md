# Tiny Wallet Proxies
The goal of these contracts are to provide a cheap forwarding contract that can receive Ether from senders that send a low gas.

This repo comes with the TinyProxy contract and the TinyProxyFactory contract.


TinyProxyFactory provides a method to quickly deploy TinyProxies and track them.

An example of a proxy that forwards to account[1], with no special gas limit, that isn't tracked by the factory.

```
  let proxy = await factory.make(accounts[1], 0, false);
```
