// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;


contract MyContract {

    // State varibales 
    address private owner;
    uint public pot = 0;

    constructor() public {
        owner = msg.sender;
    }

    function getOwner() public  view returns(address){
        return owner;
    }

    // function return the current balnce of the owner
    function getBalances() public view returns (uint256){
        return owner.balance;
    }

    // method to send money  to the owner
    function send(address, uint amount) public payable{
      if (payable(owner).send(msg.value)){
            pot += amount;
        }

    }

    
}