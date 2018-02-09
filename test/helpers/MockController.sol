pragma solidity ^0.4.11;

import "../../contracts/Controller.sol";


contract MockController is Controller {

  string public name = "Upgradeable Token";
  string public symbol = "UPT";
  uint8 public decimals = 18;

  function checkAddress(bytes32 key) public view returns (address) {
    return crate[key];
  }

}
