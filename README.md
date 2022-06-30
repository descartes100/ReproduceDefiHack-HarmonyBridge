# ReproduceDefiHack-HarmonyBridge

[Video Tutorial](https://youtu.be/52AGn0SP3d8)

# Requirement
1. Mainnet forking: Create an account on [moralis](https://moralis.io/)
2. [Foundry](https://github.com/foundry-rs/foundry)

# Usage
```
forge test --contracts ./test/Harmony.sol --fork-url https://speedy-nodes-nyc.moralis.io/[API-KEY]/eth/mainnet/archive  --fork-block-number 15012669 -vvvv
```
