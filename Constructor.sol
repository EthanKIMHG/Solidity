// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Constructor {
  address public owner;
  uint public x;
  // constructor는 deploy시에 단 한번만 실행이된다.
  constructor(uint _x) {
    owner = msg.sender;
    x = _x;
  }
}