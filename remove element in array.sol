// SPDX-License-Identifier: MIT
pragma solidity >= 0.8.7;

contract ArrayShift {
  uint[] public arr;

  function example() public {
    arr = [1,2,3];
    delete arr[1]; // [1,0,3]
  }
 /*  function check() external view returns(uint[] memory) {
    return arr;
  } */

  function remove(uint _idx) public {
    require(_idx < arr.length, "index is outof bound");
    
    for (uint i=_idx; i <arr.length; i++) {
      arr[i] = arr[i+1]; // [1,3,3]
    }
    arr.pop(); // [1,3]
  }

  function test() external {
    arr = [1,2,3,4,5];
    remove(2);
    assert(arr[0] == 1);
    assert(arr[1] == 2);
    assert(arr[2] == 4);
    assert(arr[3] == 5);
    assert(arr.length == 4);

    arr = [1];
    remove(0);
    assert(arr.length == 0);
  }
}

// another example by using Repalce the last one. but not sorted

contract ReplaceWithLast {
  uint[] public arr;

  function remove(uint _index) public {
    arr[_index] = arr[arr.length -1];
    arr.pop();
  }
  function viewArr() external view returns(uint[] memory) {
    return arr;
  }

  function test() external {
    arr = [1,2,3,4,5];
    remove(3); // [1,2,3,5,4] 에서 pop()
    assert(arr[0] == 1);
    assert(arr[1] == 2);
    assert(arr[2] == 3);
    assert(arr[3] == 5);

  }
}