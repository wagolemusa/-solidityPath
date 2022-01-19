// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

contract MyContract {
    //1 fixed-size type
    bool isReady;
    uint a;
    address recipient;
    bytes32 data;

    // 2 variables-size types

    string name;
    bytes _data;
    uint[] amounts;
    mapping(uint => string) users;

    // 3 user-defined data

    struct User {
        uint id;
        string name;
        uint[] friendsIds
    }

    enum Color {
        RED,
        GREEN,
        BLUE
    }
}