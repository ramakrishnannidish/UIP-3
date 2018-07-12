pragma solidity ^0.4.11;

import "../../contracts/LogicBank.sol";


contract MockLogicBank is LogicBank {

  string public name = "Upgradeable Token";
  string public symbol = "UPT";
  uint8 public decimals = 18;

  function MockLogicBank(uint256 _cap) public
    LogicBank(_cap)
  {

  }

  function checkAddress(bytes32 key) public view returns (address) {
    return addresses[key];
  }

}
