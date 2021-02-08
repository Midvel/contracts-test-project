
  
  

# Test smart-contracts

## Prerequisites

For development purposes, you will need `Node.js` and a package manager – `npm`. For the development, the following versions were used:
- `Node.js` – v12.18.3
- `npm` – 6.14.6

## Installation

Run the command `$ npm install` to install all the dependencies specified in `package.json`.

## Configuration

The project folder needs to be writable to perform logging.

#### `truffle-config.js`

The file contains configuration related to connection to the blockchain. For more information – read <a href="https://www.trufflesuite.com/docs/truffle/reference/configuration"  target="_blank">the Truffle docs</a>.
- `Networks`. Each of the networks subentry corresponds to the Truffle *--network* parameter.
- `Plugins`. The plugins subentry corresponds to the plugins to run using Truffle. Here *solidity-coverage* package is used as a plugin.
- `Compilers`. This section specifies versions of the compilers, and here is used to set the version of *solc* Solidity compiler to *0.6.12*.

#### `.env`
**!!! Needed to be created manually!!!**

For the deployment process to be successfully performed, the `.env` file with filled-in parameters should be present at the root of the project. In the same place, you should find a file `.env.example`. It contains all of the parameters that must be present in the `.env` file but without actual values (only parameter names). For now, these are the following:
- `GANACHE_PORT`. The port on which Ganache CLI will be running. If you did not change anything – use the default port number (which is `8545`)
- `ROPSTEN_PRIVATE_KEY`, `RINKEBY_PRIVATE_KEY`, `KOVAN_PRIVATE_KEY` and `MAINNET_PRIVATE_KEY`. Private keys for the networks. The contracts are deployed from an account (obtained from the private key that corresponds to the selected network) that should have **enough funds** to be able to deploy the contracts. You can set only those private keys that are planned to be used.
- `INFURA_API_KEY`. The project does not use an own ethereum node thus an external provider Infura is used. To obtain the key you shall visit their <a href="https://infura.io/"  target="_blank">website</a>.

## Running scripts

## *Development*

### Linters

`$ npm run dev:lint` to run Solidity and JavaScript linters and check the code for stylistic bugs.

### Tests coverage

`$ npm run dev:coverage` to examine how well developed tests cover the functionality of smart-contracts. The results can also be viewed in a web browser by opening a `coverage/` folder created by the script.

### Ganache test network

Use `$ npm run dev:ganache` to start a local Ethereum network. Here it is used for testing purposes but is not limited to this use case.

### Testing

Before running tests, a local node should be running. To do this simply run `$ npm run dev:ganache`. This will start the Ganache development network. After this, you can perform tests with `$ npm test` to run all tests from the `test/` directory.

## *Production*

### Build

Use `$ npm run compile` to compile the source code (both smart-contracts and JavaScript) to use it in the production.

### Deploy
Before proceeding with the deployment process, make sure you have read a [Configuration](#Configuration) section and set up the `.env` file.

Run `$ npm run deploy` and follow the CLI instructions to deploy the smart-contracts. For now, the following Ethereum networks are supported:
- Development (locally)
- Kovan
- Mainnet
