// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// data location 에는 3가지가 있다. storage, memory, calldata.
// storage는 기본적으로 state variable을 만들어 주는것 과 같고,
// memory는 함수 안에서 실행될 경우 함수가 종료되면 state값은 원상태로 돌아감. 함수의 input에도 사용할 수 있음.ㄴ
// calldata는 함수의 input값에만 사용 가능;.


contract LearnDataLocation {
    struct MyStruct {
        uint number;
        string text;
    }
    // 현재 주소 => MyStruct를 매핑한 상태. mystructs[주소] 의 값은 MyStruct이며, 주소마다 값이 달라진다.
    mapping(address => MyStruct) public mystructs;

    function bar (uint[] calldata y) external returns(MyStruct memory) {
        // mapping mystructs에 값을 부여해주는 행위.
        mystructs[msg.sender] = MyStruct({number: 231, text: "foo"});
        //Mystruct 구조체인 mystructs[msg.sender]를 storage에 저장해서 myStruct라는 변수에 재할당.
        // 이로서 얻을 수 있는것은 mystructs[msg.sender]의 Struct값을을 변경해줄 수 있는 점이다.
        MyStruct storage myStruct = mystructs[msg.sender];
        // 아래와 같이 재 할당된 myStruct값을 변경시켜 주면, 위에 20번째줄에서 정의 내린 것을 대체할 수 있음.
        myStruct.number = 123;
        myStruct.text = "bar";
        _internal(y);
        // 하지만 아래와 같이 memory에 저장될 경우 여기서 readOnly를 읽거나 bar함수에서 readOnly를 리턴하지 않는다면,
        // memory는 함수 외부에 있는 상태값을 변경시킬 수는 없다.
        MyStruct memory readOnly = mystructs[msg.sender];

        readOnly.number = 3333;
        readOnly.text = "only readable";
        // return type을 struct자체를 리턴해줄 수 있음 그래서 memory에 존재하는 MyStruct를 리턴할 수 있다.
        return (readOnly);
    }
    // calldata는 함수의 매개변수나 인자로 사용됨. calldata를 사용하는 이유는 gas비 절약을 위해서 이다.
    // 예를 들어, 27번째 줄에 있는 _internal이 실행되면, 18번 줄에있는 parameter가 memory일 경우 uint[] y 를 생성해서
    // 메모리에 저장한뒤 또 아래 _internal함수에, uint[]에 저장하게 되므로, calldata를 적절히 사용할 경우 가스비 절약 효과.
    function _internal(uint[] calldata y) private {
        uint x = y[0];
    }
}

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
