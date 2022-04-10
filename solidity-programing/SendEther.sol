// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

//  3 ways of sending Ether form anather contract
// Transfer - 2000 gas, reverts
// Send  -  2000 gas, return bool
// Call - all gas, returns bool and data

contract SendEther {
    constructor() payable {}

    receive() external payable {}

    function sendViaTransfer( address payable _to) external payable{
        _to.transfer(1234);
    }

    function sendViaSend(address payable _to) external payable {
        bool sent = _to.send(123);
        require(sent, "Send Faild");
    }

    //  When using this function it takes alot of gass
    function sendViaCall(address payable _to) external payable {
        (bool success, ) = _to.call{value: 123}("");
        require(success, "call Faild");
    } 
}

contract EthReciever {
    event Log(uint amount, uint gas);

    receive() external payable {
        emit Log(msg.value, gasleft());
    }
}

