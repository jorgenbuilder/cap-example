A minimal working example of CAP in Motoko.

[main.mo](src/main.mo)

Deploy locally:

1. Start a local version of the cap router canister.
2. dfx deploy --no-wallet --argument "(<LOCALNET_CAP_ROUTER_CANISTER_PRINCIPAL>)"
3. dfx canister call minimalcap init

```
(variant { ok })
```

---

This doesn't work on mainnet! Steps to reproduce:

1. dfx deploy --network ic --argument "(null)"
2. dfx canister --network ic call minimalcap init

```
The Replica returned an error: code 4, message: "Error installing code: IC0502: Canister lj532-6iaaa-aaaah-qcc7a-cai trapped: unreachable"
```