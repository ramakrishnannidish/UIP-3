# ERC-1214: Upgradeability Improvement Protocol (UIP-3)

This repository contains the implementation of the ERC-1214 standard, which was submitted to Ethereum as an Upgradeability Improvement Protocol (UIP-3). The standard aims to enhance smart contract upgradeability while maintaining flexibility and security. It introduces a modularization approach using a **Data Centre** for handling upgrades and proxy implementations, thus allowing contracts to evolve over time without losing state or compromising on security.

## Overview

ERC-1214 (Upgradeability Improvement Protocol 3) is a proposed solution to overcome the challenges of upgrading smart contracts deployed on the Ethereum blockchain. With the rise of decentralized applications (DApps), the need for a flexible upgrade path has become more apparent. UIP-3 proposes a solution using **proxy contracts** that delegate logic to different modules, enabling seamless upgrades while maintaining the integrity of existing contracts.

For more information on the underlying principles, please refer to the original proposal and articles:
- [UIP-3 Medium Article](https://medium.com/deqode/upgradeability-improvement-protocol-3-near-transcendence-f29342e5d3a9)
- [ERC-1214 GitHub Repository](https://github.com/techracers-blockchain/ERC-1214)
- [EIP-1214 Proposal Discussion](https://github.com/ethereum/EIPs/issues/1214)

### Proxy Implementation

UIP-3 uses a **proxy pattern** where a proxy contract forwards calls to an implementation contract. This pattern separates the logic and data, enabling independent upgrades to the logic contract without altering the state. This is achieved via a **Data Centre**, which acts as a central authority managing state and contract logic.

### Key Features
- **Modularization Approach**: Contracts are divided into modules that can be individually upgraded without affecting the rest of the system.
- **Data Centre**: Stores data and state while keeping logic modules upgradeable.
- **Proxy Pattern**: Allows logic to be modified without requiring a redeployment of the entire contract system.
- **Secure Upgrades**: Enables upgrading contract functionality without disrupting existing users or affecting contract state.

## Installation

To use or contribute to this implementation, follow the steps below:

### Prerequisites

Ensure you have the following installed:
- [Node.js](https://nodejs.org/)
- [npm](https://www.npmjs.com/)

### Install Dependencies

Run the following command to install the project dependencies:

```bash
npm install
```

After installing the required dependencies, you're ready to interact with the ERC-1214 smart contract implementation, run tests, and check code coverage.

## Running Tests

Unit tests are provided to verify the functionality of the ERC-1214 implementation. You can run the entire test suite or individual tests.

## 1. Run All Tests

To run all the tests, execute:

```bash
npm test
```

## 2.Run Individual Tests

You can also run specific tests. For example, to run the logicalToken.js test, use:

```bash
npm test test/logicalToken.js
```

### 3. Code Coverage
To generate a code coverage report, run the following command:

```bash
npm run coverage
```

This will provide a detailed report on the test coverage of the smart contract implementation.


## Modularization Approach to Upgradeability

One of the key innovations in this ERC-1214 implementation is the modularization approach using a **Data Centre**. In this architecture:

- **Logic Contracts**: Handle the core functionality and can be upgraded over time.
- **Proxy Contract**: Acts as an intermediary that forwards calls to the appropriate logic contract.
- **Data Centre**: Manages and stores the state across different contract versions, ensuring that state is never lost during upgrades.

By separating the logic and state, this approach enables seamless upgrades without compromising contract security or usability. It offers a robust solution to Ethereum's challenge of upgrading live contracts.

### Benefits of the Proxy Implementation:

- **Decoupling Logic and Data**: Makes upgrades easier by maintaining a consistent data structure while updating logic as needed.
- **Minimized Risk**: Since the proxy maintains the original contract’s state, upgrading the logic doesn't affect the contract's users.
- **Flexibility**: Modular design allows for the upgrading of specific contract modules instead of the entire contract system.

For more details, you can refer to the original [UIP-3 Medium Article](https://medium.com/deqode/upgradeability-improvement-protocol-3-near-transcendence-f29342e5d3a9)

We welcome improvements, feature requests, and bug fixes.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.