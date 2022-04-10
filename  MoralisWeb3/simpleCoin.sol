// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

contract Coin {

    address public minter;

    mapping(address => uint) public balances;

    event Send(address from, address to, uint amount);

    constructor(){
        minter = msg.sender;
    }

    function mint(address reciever, uint amount) public {
        require(msg.sender == minter);
        require(amount < 1e60);
        balances[reciever] += amount;
    }

    function send(address reciever, uint amount) public {
        require(amount <= balances[msg.sender], "No Funds.");
        balances[msg.sender] -= amount;
        balances[reciever] += amount;

        emit Send(msg.sender, reciever, amount);
    }

}