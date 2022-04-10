// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

contract SimpleAction {

    // paramenters of the simpleAction
    address payable public beneficiary;
    uint public auctionEndTime;

    // current state of the auctionEndTime
    address public highestBidder; // adderss for the highestbidder
    uint public highestBid; // the highest bid amount 

    /*
        Keep track of address
        This Mapping is gona be used for keeping tracker what address has been, how much,
        has been out bid there4 is waiting for whatever amount they have origin to return to them
    */
    mapping(address => uint) public pendingReturns;  

    bool ended = false;

    event HighestBidIncrease(address bidder, uint amount);
    event AuctionEnded(address winner, uint amount);

    constructor(uint _biddingTime, address payable _beneficiary){
        beneficiary = _beneficiary;
        auctionEndTime = block.timestamp  + _biddingTime;
    } 

    function bid() public payable {
        if (block.timestamp > auctionEndTime){
            revert("The action has been  already ended");
        }
        if (msg.value <= highestBid){
            revert("There is already a higher or equal bid");
        }

        if (highestBid != 0){
            pendingReturns[highestBidder] += highestBid;
        }
        highestBidder = msg.sender;
        highestBid = msg.value;

        emit HighestBidIncrease(msg.sender, msg.value);
    }

    function widthdraw() public returns(bool){
        uint amount = pendingReturns[msg.sender];
        if(amount > 0){
            pendingReturns[msg.sender] = 0;

            if(!payable(msg.sender).send(amount)){
                pendingReturns[msg.sender] = amount;
                return false;
            }
        }
        return true;
    }   

    function auctionEnd() public {
        if(block.timestamp < auctionEndTime){
            revert("The auction is not ended yet");
        }
        if (ended){
            revert("The function autionEnded has already been called");
        }
        ended = true;
        emit AuctionEnded(highestBidder, highestBid);
        beneficiary.transfer(highestBid);
    }                                                                                                                                                                                                    
}