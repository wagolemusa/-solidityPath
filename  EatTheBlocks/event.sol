// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;


contract MyContract {

    //  events
    event NewTrade (
        uint date,
        address from,
        address to,
        uint amount
    );

    function trade(address to, uint amount) external {
        emit NewTrade(now, msg.sender, to, amount);
    }
}