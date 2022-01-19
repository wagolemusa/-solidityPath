// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

contract MyContract {
    // trasfer
    // address vs address payable
    // address payable casting (address and uint1 60)
    // msg.sender
    // send vs transfer

    address payable[] recipients;

    function sendEther(address payable recipient) external {
        // transfer ether from this smart contract to recipient
        recipient.transfer(1 ether);

        address a;
        a = recipient;

        a.transfer(100);

        msg.sender.transfer(100);

        recipient.send(1 ether);

    }
}