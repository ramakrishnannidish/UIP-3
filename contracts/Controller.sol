pragma solidity ^0.4.11;

import "./MintableToken.sol";
import "./PausableToken.sol";


contract Controller is PausableToken {

  string public name = "Upgrade-able Token";
  string public symbol = "UPT";
  uint8 public decimals = 18;

}
