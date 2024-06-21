// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

contract holders {

    uint totalHolders;
    
    mapping(uint => address) private addr;

    mapping(address => uint) private shares;

    function GetShares(uint shares) public {

        holders[totalHolders] = msg.sender;

        shares[msg.sender] = shares; 

        totalHolders++;
    } 

    function PayOut() public {
        uint shares;
        for(uint i = 0 ; i < totalHolders; i++) {
        shares = shares[holders[i]];
        }
    }
}