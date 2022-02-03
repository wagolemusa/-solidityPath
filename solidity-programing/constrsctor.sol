// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

//  A constractor is called once when the application is deployed
contract  Constructor {
    address public owner;
    uint public x;

    constructor(uint _x) {
        owner = msg.sender;
        x = _x;
    }
}