# ReproduceDefiHack-HarmonyBridge

[Video Tutorial](https://youtu.be/52AGn0SP3d8)

# About the attack
1. [News](https://news.bitcoin.com/harmonys-100m-hack-was-due-to-a-compromised-multi-sig-scheme-says-analyst/)
2. [Attacker Address](https://etherscan.io/address/0x0d043128146654c7683fbf30ac98d7b2285ded00)

# Requirement
1. Mainnet forking: Create an account on [moralis](https://moralis.io/)
2. [Foundry](https://github.com/foundry-rs/foundry)

# Usage
```
forge test --contracts ./test/Harmony.sol --fork-url https://speedy-nodes-nyc.moralis.io/[API-KEY]/eth/mainnet/archive  --fork-block-number 15012669 -vvvv
```
