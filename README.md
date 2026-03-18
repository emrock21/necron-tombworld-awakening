# Necron Tombworld Awakening Protocol

An immutable on-chain registry documenting the awakening of Necron tombworlds across the galaxy.  
Each interaction records a new awakening event, permanently stored on the blockchain.

This project is inspired by the Necron dynasties of Warhammer 40,000 and serves as a lore-driven, non-financial, fully transparent data archive.

---

## Contract Address and Verification

The contract is deployed and verified on BaseScan:

**https://basescan.org/address/0x1e86848a1f84342adf6f3b54164c57fdfb725312#code**

From this page you can:

- Inspect the verified source code  
- Read all recorded awakening events  
- Call `recordAwakening` to add new entries  
- Explore emitted `AwakeningRecorded` events  

---

## Contract Overview

Main file: `contracts/NecronTombworldAwakening.sol`

The contract exposes:

- `Awakening[] public awakenings` – full registry of awakening events  
- `recordAwakening(string tombworld, string dynasty, string awakeningStage, string detectedUnit)`  
- `totalAwakenings()` – returns the total number of entries  
- `AwakeningRecorded` event with indexed fields  

Each `Awakening` entry contains:

- `tombworld` – name or designation of the tombworld  
- `dynasty` – Necron dynasty associated with the awakening  
- `awakeningStage` – Dormant, Stirring, Active, Fully Awakened  
- `detectedUnit` – type of Necron unit detected  
- `cryptek` – address that submitted the report  
- `timestamp` – block timestamp  

A text size limit (1000 characters per field) prevents oversized inputs.

---

## Safety

This contract is intentionally minimal and safe for public interaction:

- No `payable` functions  
- No ETH transfers  
- No external calls  
- No ownership or admin roles  
- No token or financial logic  
- No `selfdestruct`  

It is a pure lore and data-logging contract.

---

## Purpose

This project serves as:

- A thematic Necron on-chain archive  
- A demonstration of historical state recording in Solidity  
- A creative, non-financial blockchain experiment  

---

## License

This project is released under the MIT License.
