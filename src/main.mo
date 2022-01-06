import Cap "mo:cap/Cap";
import Debug "mo:base/Debug";
import Error "mo:base/Error";
import Principal "mo:base/Principal";
import Result "mo:base/Result";
import Root "mo:cap/Root";
import Types "mo:cap/Types";

shared actor class InsertExample (
    overrideRouterCanister : ?Text,
) = thisCanister {
    type DetailValue = Root.DetailValue;
    type Event = Root.Event;
    type IndefiniteEvent = Root.IndefiniteEvent;

    // If the local replica router is not set
    // then the mainnet id is used "lj532-6iaaa-aaaah-qcc7a-cai" 
    // and because the expected argument is an optional we pass as ?xxx
    let cap = Cap.Cap(overrideRouterCanister, null);

    // The number of cycles to use when initialising
    // the handshake process which creates a new canister
    // and install the bucket code into cap service
    let creationCycles : Nat = 100_000_000_000;

    public func id() : async Principal {
        return Principal.fromActor(thisCanister);
    };

    public shared func init() : async Result.Result<(), Text> {
        // Your application canister token contract id
        // e.g. execute the command dfx canister id cap-motoko-example
        // in the cap-motoko-library/examples directory
        // after you have deployed the cap-motoko-example
        let pid = await id();
        let tokenContractId = Principal.toText(pid);

        // As a demo, the parameters are hard-typed here
        // but could be declared in the function signature
        // and pass when executing the request
        try {
            let handshake = await cap.handshake(
                tokenContractId,
                creationCycles
            );
            return #ok();
        } catch e {
            throw e;
        };
    };
};