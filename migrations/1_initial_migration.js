const tkn = artifacts.require("MyToken");

module.exports = function (deployer) {
    deployer.deploy(tkn);
};
