// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.1;

contract StartContractor {

    address public  owner;
    bool public paused;

    constructor() {
        owner = msg.sender;
    }

    function sendManey() public payable {

    }
    
    function setPaused(bool _paused) public {
        require(msg.sender == owner, "You are the owner");
        paused = _paused;
    }

    function widthdrawAllMoney(address payable _to) public {
        require(owner == msg.sender, "You cannot withdrow");
        require(paused == false, "Contract paaused");
        _to.transfer(address(this).balance);
    }

    function destroySmartCintract(address payable _to) public {
        require(msg.sender == owner, "You not the owner");
        selfdestruct(_to);
    }
    
}