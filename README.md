# EN

## FundMe - Decentralized Crowdfunding Contract

### 🚀 Description
Only the contract owner can withdraw collected funds. The project replicates the idea of **Kickstarter**, but fully **on-chain**.
FundMe is a **decentralized crowdfunding smart contract** where users can send native blockchain tokens (ETH, MATIC, AVAX, etc.) with a **minimum contribution threshold set in USD**.  

### 🔑 Features
- Payable `fund` function with enforced USD minimum.
- Real-time contract balance updates after transactions.
- Owner-only withdrawal (`withdraw`).
- Gas optimizations using `constant` and `immutable`.
- Support for Solidity’s special functions (`receive`, `fallback`, `constructor`).

### 🛠️ Stack & 
- **Solidity**
- **Remix IDE**
- **MetaMask**
- **Ethereum testnets**

### 📚 Skills Acquired
- Writing, deploying, and interacting with smart contracts.
- Using Solidity libraries (`PriceConverter`).
- Implementing custom errors, modifiers, loops, and immutables.
- Gas efficiency optimization.

### 📌 Next Steps
Move from Remix to a local development environment (Foundry/Hardhat) and explore advanced Solidity features:  
- Events, enums, try-catch
- Function selectors, `abi.encode`, hashing
- Yul & assembly

### 📂 Project Structure
/contracts
├── FundMe.sol # Main crowdfunding contract
├── PriceConverter.sol # Library for value conversion


# FR

## FundMe - Contrat de Crowdfunding Décentralisé

### 🚀 Description
FundMe est un **contrat de financement participatif décentralisé** permettant à des utilisateurs d’envoyer des cryptomonnaies natives (ETH, MATIC, AVAX, etc.) au contrat, avec un **montant minimum fixé en USD**.  
Seul le propriétaire peut retirer les fonds collectés. Le projet reprend le principe de plateformes comme **Kickstarter**, mais en version **on-chain**.

### 🔑 Fonctionnalités
- Contribution via une fonction `fund` payable avec seuil minimum en USD.
- Gestion des transactions et du solde du contrat en temps réel.
- Retrait des fonds par le seul propriétaire (`withdraw`).
- Optimisations gas grâce à l’utilisation de `constant` et `immutable`.
- Support des fonctions spéciales Solidity (`receive`, `fallback`, `constructor`).

### 🛠️ Stack & Outils
- **Solidity**
- **Remix IDE**
- **MetaMask**
- **Testnets Ethereum**

### 📚 Compétences acquises
- Développement et interaction avec des smart contracts déployés.
- Mise en œuvre de librairies Solidity (`PriceConverter`).
- Gestion des erreurs, modifiers, boucles et variables immuables.
- Optimisation du coût en gas.

### 📌 Prochaines étapes
Migration vers un environnement local (Foundry/Hardhat) avec intégration de concepts avancés :
- Events, enums, try-catch
- Function selectors, `abi.encode`, hashing
- Yul & assembly

### 📂 Structure du projet
/contracts
├── FundMe.sol # Contrat principal
├── PriceConverter.sol # Librairie pour conversion de valeur