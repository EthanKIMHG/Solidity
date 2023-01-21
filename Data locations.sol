// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// data location 에는 3가지가 있다. storage, memory, calldata.
// storage는 기본적으로 state variable을 만들어 주는것 과 같고,
// memory는 함수 안에서 실행될 경우 함수가 종료되면 state값은 원상태로 돌아감. 함수의 input에도 사용할 수 있음.ㄴ
// calldata는 함수의 input값에만 사용 가능;.

contract DataLocations {
    uint[] public arr;
    mapping(uint => address) map;
    struct MyStruct {
        uint foo;
    }
    mapping(uint => MyStruct) myStructs;

    function f() public {
        // call _f with state variables
        _f(arr, map, myStructs[1]);

        // get a struct from a mapping
        MyStruct storage myStruct = myStructs[1];
        // create a struct in memory
        MyStruct memory myMemStruct = MyStruct(0);
    }

    function _f(
        uint[] storage _arr,
        mapping(uint => address) storage _map,
        MyStruct storage _myStruct
    ) internal {
        // do something with storage variables
        _map[0] = msg.sender;
        _arr[2] = 1;
        _myStruct.foo = 1;
    }

    // You can return memory variables
    function g(uint[] memory _arr) public returns (uint[] memory) {
        // do something with memory array
        arr = _arr;
        return arr;
    }

    function h(uint[] calldata _arr) external {
        // do something with calldata array
        
    }
}
