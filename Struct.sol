// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// Struct 에 대해 알아보자.
// struct는 기본적으로, 여러가지 type을 담을 수있다.
contract Struct {
  struct Car {
    string model;
    uint year;
    address owner;
  }

  Car public car;
  Car[] public cars;
  // owner은 다량의 차를 가지고 있을 수 있기 때문에 mapping 해줌.
  mapping(address => Car[]) public carsByOwner;

  // 사용법
  
  function examples() external {
    // 1. put all the parameter in the struct
    // 순서에 맞게 넣어줘야함.
    Car memory toyota = Car("toyota", 1802, msg.sender);
    // 2. 객체 형태로 넣어주면 순서에 상관 없어도 가능.
    Car memory hyundai = Car({model : "Hyundai", year: 1909, owner: msg.sender});
    // year 이 다른곳에 있어도 가능
    Car memory ex1 = Car({year: 1231, model : "Hyundai", owner: msg.sender});
    // default value로 설정 후에 struct의 요소를 직접 넣어줄 수있음.
    Car memory tesla; 
    tesla.model = "Tesla";
    tesla.year = 2010;
    tesla.owner = msg.sender;
    
    cars.push(toyota);
    cars.push(hyundai);
    cars.push(tesla);
    // 그리고 이를 한번에 할 수 있는방법은,
    cars.push(Car({model : "Hyundai", year: 1909, owner: msg.sender}));


    // 위의 cars 배열에 접근해서 특정 값을 가져오거나, 변경하고 싶으면 다음과 같이 하면됨.
    // 1. 변경하기
    Car storage _car2 = cars[1];
    _car2.year = 3312;

    // 2. 읽어오기
    Car memory _car = cars[0];
    _car.model;
    _car.year;
    _car.owner;

    // 3.삭제하기
    delete _car.owner;
    // cars[1]은 default Value 가 됩니다.
    delete cars[1];

  }
}