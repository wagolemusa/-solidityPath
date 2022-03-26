// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

contract Fallback{

    event Log(string fun, address sender, uint value, bytes data);

    fallback() external payable {
        emit Log("Fallback", msg.sender, msg.value, msg.data);
    }
    receive() external payable {
        emit Log("recieve", msg.sender, msg.value, "");
    
    }
}