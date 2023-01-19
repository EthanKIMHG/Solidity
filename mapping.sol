// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Mapping {
  // 솔리디티에서 매핑은 자바스크립트에서 객체의 값에 할당하는것과 같음.
  // 아래의 내용, let balance =  {"address" : uint}
  // balance["address"] = uint 값인것 처럼, 솔리디티도 아래의 예시처럼 key값으로 value 를 조절할 수 있다.
  mapping (address => uint) public balance;
  mapping (address => mapping(address => bool)) public isFriend;

  function checkBalance() external {

    uint bal = balance[msg.sender];
    uint bal2 = balance[address(1)];

    balance[msg.sender] += 123;
    isFriend[msg.sender][address(this)] = true;
  }
}
//0xe758F5b3F2355d7c8ad323A7B51E9616132DEAcB
//0x1d0d8b15C13E8793d9f7dBbb7BcC4eC2d76abc52
//0xAFFBa1A44Eb3c1FE005Cb4a2D6e2CAe22F4018a1

contract IterableMapping {
  mapping(address => uint) public balance;
  mapping(address => bool) public inserted;
  address[] public keys;

  function set(address _key, uint _val) external {
    balance[_key] = _val;

    if (!inserted[_key]) {
      inserted[_key] = true;
      // keys 배열에 address를 push해주면, 해당 인덱스별로 관리 할 수 있음.
      keys.push(_key);
    }
  }
  function getSize() external view returns(uint) {
    return keys.length;
  }
  function getFirstAccountBalance() external view returns(uint) {
    return balance[keys[0]];
  }
  function getLastAccountBalance() external view returns(uint) {
    return balance[keys[keys.length-1]];
  }
  function getSpecificAccountBalance (address _address, uint _i) external view returns(uint, uint) {
    return (balance[_address], balance[keys[_i]]);
  }
}