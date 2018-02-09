pragma solidity ^0.4.11;

import "./MintableToken.sol";


contract Controller is MintableToken {

  string public name = "Upgradeable Token";
  string public symbol = "UPT";
  uint8 public decimals = 18;

}
