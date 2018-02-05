pragma solidity ^0.4.11;

import "./ERC20.sol";
import "./ERC223ReceivingContract.sol";

contract Controller is ERC20 {
  address public tokenAddr;
  uint256 internal total_supply;
  mapping(address => uint256) internal balances;
  mapping (address => mapping (address => uint)) internal allowed;

  function Controller(address _tokenAddr) public
  {
    tokenAddr = _tokenAddr;
  }

  // ############################################
  // ########### ERC20 FUNCTIONS  ###############
  // ############################################

  function name() public constant returns (string) {
    return "Upgradeable token";
  }

  function symbol() public constant returns (string) {
    return "UPT";
  }

  function decimals() public constant returns (uint256) {
    return 18;
  }

  function totalSupply() public constant returns (uint256) {
    return total_supply;
  }

  function balanceOf(address _owner) public constant returns (uint256) {
    return balances[_owner];
  }

  function allowance(address _owner, address _spender) public constant returns (uint256) {
    return allowed[_owner][_spender];
  }
}
