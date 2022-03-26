// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

contract MyStuct{

    struct Car{
        string model;
        uint year;
        address owner;
    }

    Car public car;
    Car[] public cars;

    mapping(address => Car[]) public carsByOwner;

    function exampleStruct() external {
        Car memory toyota  = Car("Toyota", 1990, msg.sender);
        Car memory lambo  = Car({year: 1670, model: "Lamboghine", owner: msg.sender}); 
        Car memory tesla;
        tesla.model = "Tesla";
        tesla.year = 1679;
        tesla.owner = msg.sender;

        cars.push(toyota);
        cars.push(lambo);
        cars.push(tesla);

        // Same way to push into Car list like using memory
        cars.push(Car("Ferrari", 2020, msg.sender));

        Car storage  _car = cars[0];
        _car.year = 1994;
        delete _car.owner;
        delete cars[1];

    }

}