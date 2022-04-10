// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

contract Coin {

    address public minter;

    mapping(address => uint) public balances;

    event Send(address from, address to, uint amount);

    modifier onlyOwner{
         require(msg.sender == minter, "Only the owner to mint this function");
         _;
    }

    modifier amountGreaterThan(uint amount){
        require(amount < 1e60);
        _;
    }

    modifier balanceGreaterThanAmount(uint amount){
          require(amount <= balances[msg.sender], " Insuffient balance.");
          _;
    }

    constructor(){
        minter = msg.sender;
    }

    function mint(address reciever, uint amount) public onlyOwner amountGreaterThan(amount) {
        balances[reciever] += amount;
    }

    function send(address reciever, uint amount) public balanceGreaterThanAmount(amount){
        balances[msg.sender] -= amount;
        balances[reciever] += amount;
        emit Send(msg.sender, reciever, amount);
    }

}