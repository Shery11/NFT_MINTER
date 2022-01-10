// this file is used to deploy the contracts
const LipToken = artifacts.require("LipToken");

module.exports = function (deployer) {
    // this is the params of the constructor in SC
    deployer.deploy(LipToken, "LipTokens", "LIPS");
};
