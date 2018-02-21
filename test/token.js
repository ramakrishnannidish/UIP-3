const UpgradeableToken = artifacts.require('./UpgradeableToken.sol');
const Controller = artifacts.require('./Controller.sol');
const hexToString = require('./helpers/hexToString');

contract('UpgradeableToken', (accounts) => {
  let token;
  let controller;

  beforeEach(async () => {
    token = await UpgradeableToken.new();
    controller = await Controller.new(token.address);
    await token.setController(controller.address);
  });

  it('it should delegate call to controller and allow transfer', async () => {

    var pauseData = ((web3.eth.contract(controller.abi)).at(controller.address)).pause.getData();
    await web3.eth.sendTransaction({from: accounts[0], to: token.address, data: pauseData, gas: 4500000});

    var assignData = ((web3.eth.contract(controller.abi)).at(controller.address)).assignTokens.getData(accounts[0], 10000000000000);
    await web3.eth.sendTransaction({from: accounts[0], to: token.address, data: assignData, gas: 4500000});

    var unpauseData = ((web3.eth.contract(controller.abi)).at(controller.address)).unpause.getData();
    await web3.eth.sendTransaction({from: accounts[0], to: token.address, data: unpauseData, gas: 4500000});

    var transferData = ((web3.eth.contract(controller.abi)).at(controller.address)).transfer.getData(accounts[1], 10000000000000);
    await web3.eth.sendTransaction({from: accounts[0], to: token.address, data: transferData, gas: 4500000});

    var balanceOfData = ((web3.eth.contract(controller.abi)).at(controller.address)).balanceOf.getData(accounts[1]);
    const balance = parseInt(await web3.eth.call({from: accounts[1], to: token.address, data: balanceOfData, gas: 4500000}), 16)

    var totalSupplyData = ((web3.eth.contract(controller.abi)).at(controller.address)).balanceOf.getData(accounts[1]);
    const totalSupply = parseInt(await web3.eth.call({from: accounts[1], to: token.address, data: totalSupplyData, gas: 4500000}), 16);

    assert.equal(balance, 10000000000000);
    assert.equal(totalSupply, 10000000000000);
  });
});
