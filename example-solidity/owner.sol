// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;


contract Ownable {
    address public owner;

    function Admin() public {
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender == owner);
        _;
    }

    function transferOwnership(address newOner) onlyOwner public {
        if (newOner != address(0)) {
            owner = newOner;
        }
    }
}


contract Esrow is Ownable {
    mapping (address => uint) public accountPending;
    address[] public depositingAddress;

    function depositMoney(address man, uint amount) payable public {
        require(msg.value > 0);
        // record amount deposited by this account
        accountPending[msg.sender] = msg.value;
        // store this address in memory so we can use it as akey for accountPendinng
        depositingAddress[depositingAddress.length] = msg.sender;
    }

    
    function widthdrawMoney() public payable onlyOwner {
        uint storedAmount = 0;
        for (uint i =0; i < depositingAddress.length; i++){
            // get total amount stored by each address 
            storedAmount += accountPending[depositingAddress[i]];
            // set each desposted amount to 0 since we withdrawing it
            accountPending[depositingAddress[i]] = 0;
        }
        // transfer to your self
        payable(msg.sender).transfer(storedAmount);
    }

    // this is the function that gets called it  someone just send monet directly to the contranct

    // function send() public payable {
    //     depositMoney(man, amount);
    // }
}