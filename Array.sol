// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Array {
  // arr는 기본적으로 uint[]로 되어서 public 으로 이용할때 idx값을 넣어주면 해당 인덱스의 값이 나옴.
  uint[] public arr =[1,2,3];
  uint[3] public arrFixed = [4,5,6];

  function examples() external returns (uint, uint){
    arr.push(4); //[1,2,3,4];
    uint x = arr[1]; //2;
    arr[2] = 777; // [1,2,777,4];
    delete arr[1]; // [1,0,777,4];
    arr.pop(); //[1,0,777];
    uint len = arr.length;


    // array를 memory에 저장하고싶을때 아래와 같이 작성하면되는데,
    // 항상 fixed여야함.
    uint[] memory a = new uint[](5);
    a[1] = 123;

    return (x, len);
  }
  // array를 memory에 저장하고 리턴하고 싶을때 but not recommanded. gas비용 엄청나
  function returnArr() external view returns (uint[] memory) {
    return arr;
  }
}