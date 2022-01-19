// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;


contract MyContract{
    // Sending Ether to a smart contract (function payable keyword)

    function invest() external payable {
        // check if the number is less than 1000 then it cancle
        if(msg.value < 1000){
            revert(); // cancle
        }
        // access the balances of the sender
        balances[msg.sender] += msg.value;

    }

    function balanceOff() external view returns(uint) {
        return address(this).balance;
    }
}