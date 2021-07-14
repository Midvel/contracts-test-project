const Web3 = require("web3");
const web3 = new Web3(Web3.givenProvider || "ws://localhost:8545");
const { expect } = require("chai");
const BigNumber = require("bignumber.js");
const { constants } = require("@openzeppelin/test-helpers");
const timeMachine = require("ganache-time-traveler");
const truffleAssert = require("truffle-assertions");

const MyToken = artifacts.require("MyToken");

BigNumber.config({ EXPONENTIAL_AT: 1e9 });

describe("Testset for token properties", () => {
    let deployer;
    let user1, user2;

    let token;
    let snapshotId;

    before(async () => {
        [deployer, user1, user2] = await web3.eth.getAccounts();

        console.log(user1, user2);
        token = await MyToken.new({ from: deployer });
    });

    describe("Simple test", () => {
        beforeEach(async () => {
            // Create a snapshot
            const snapshot = await timeMachine.takeSnapshot();
            snapshotId = snapshot["result"];
        });

        afterEach(async () => await timeMachine.revertToSnapshot(snapshotId));

        it("Test supply", async () => {
            expect((await token.totalSupply()).toNumber()).to.equal(0);
        });

        it("Cannot mint zero amount", async () => {
            await truffleAssert.reverts(token.mint(0, { from: deployer }), "Incorrect amount");
        });
    });
});
