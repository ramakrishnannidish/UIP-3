pragma solidity ^0.4.11;

import 'zeppelin-solidity/contracts/math/SafeMath.sol';
import "./ERC20.sol";
import "./ERC223ReceivingContract.sol";
import "./Pausable.sol";

contract Controller is ERC20, Pausable {
  using SafeMath for uint;

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

  function approve(address _spender, uint256 _amount) public {
    require(msg.sender != _spender);
    allowed[msg.sender][_spender] = _amount;
  }

  function transfer(address _to, uint256 _amount, bytes _data) public returns (bool) {
    _transfer(msg.sender, _to, _amount, _data);
    Transfer(msg.sender, _to, _amount);
    _checkDestination(msg.sender, _to, _amount, _data);
    return true;
  }

  function transfer(address _to, uint256 _amount) public returns (bool) {
    bytes memory empty;
    return transfer(_to, _amount, empty);
  }

  function transferFrom(address _from, address _to, uint256 _amount, bytes _data) public returns (bool) {
    allowed[_from][_to] = allowed[_from][_to].sub(_amount);
    _transfer(_from, _to, _amount, _data);
    Transfer(_from, _to, _amount);
    _checkDestination(_from, _to, _amount, _data);
    return true;
  }

  function transferFrom(address _from, address _to, uint256 _amount) public returns (bool) {
    bytes memory empty;
    return transferFrom(_from, _to, _amount, empty);
  }

  function _transfer(address _from, address _to, uint256 _amount, bytes _data) internal {
    require(_to != address(this));
    require(_to != address(0));
    require(_amount > 0);
    require(_from != _to);
    balances[_from] = balances[_from].sub(_amount);
    balances[_to] = balances[_to].add(_amount);
  }

  function _checkDestination(address _from, address _to, uint256 _value, bytes _data) internal {
    // erc223: Retrieve the size of the code on target address, this needs assembly .
    uint256 codeLength;
    assembly {
      codeLength := extcodesize(_to)
    }
    if(codeLength>0) {
      ERC223ReceivingContract untrustedReceiver = ERC223ReceivingContract(_to);
      // untrusted contract call
      untrustedReceiver.tokenFallback(_from, _value, _data);
    }
  }
}