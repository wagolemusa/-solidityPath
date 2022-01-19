// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

contract MyContract {
    // declear struct
    // GURD
    // Array of Strct
    // Mapping of struct

    // Declearing struct
    struct  User {
        address addr;
        uint score;
        string name;
    }

    // Array of struct
    User[] users;

    // Mapping of struct
    mapping(address => User)userList2;

    function foo(string calldata _name) external {
        User memory user1 = User(msg.sender, 0, _name);
        User memory user2 = User(msg.sender, 0, _name);
        User memory user3 = User({name: _name, score: 0, addr: msg.sender});
        user3.addr;
        user3.score = 20;
        delete user1;

        users.push(user2);

        userList2[msg.sender] = user2;

    }
}
