// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// Solidity 언어에는 각 type마다 Default value 가 있습니다. 자바스크립트와는 다른점입니다.
contract DefaultValues {
  bool public b; // false
  int public i; // 0
  uint public u; // 0
  address public a; // 0x0000000000000000000000000000000000000000
  bytes32 public b32; //0x0000000000000000000000000000000000000000000000000000000000000000
}