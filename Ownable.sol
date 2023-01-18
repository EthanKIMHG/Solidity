// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Ownable {
  address public owner;

  constructor() {
    // contract가 deploy될때 owner를 전역변수인 msg.sender 로 설정해준다.
    owner = msg.sender;
  }
  modifier onlyOwner() { // owner 가 msg.sender가 아니면 실행이 안되게 하는 modifier 을 설정해주고,
    require(msg.sender == owner, "not owner");
    _;
  }
  // onlyOwner만 실행할 수 있는 setOwner을 만들어주고, owner를 변경시킬 수 있게 만들어주는 함수를 만든다.
  function setOwner(address _newOwner) external onlyOwner {
    require(_newOwner != address(0), "invalid address");
    owner = _newOwner;
  }

  function onlyOwnerCancall() external onlyOwner {

  }
  function anyoweCancall() external {
    
  }
}