// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

contract Escrow {
    // VARIBLES
    enum  State { NOT_INITIATED, AWAITING_PAYMENT, AWAITING_DELIVERY, COMPLETE }

    State public currentSate;

    bool public isBuyerIn;
    bool public isSellerIn;
    uint public price;

    address public buyer;
    address payable public seller;

    // MODIFIERS
    modifier onlyBuyer(){
        require(msg.sender == buyer, "Only buyer call this function");
        _;
    }

    modifier escrowNotStarted() {
        require(currentSate == State.NOT_INITIATED);
        _;

    }

    // functions

    constructor(address _buyer, address payable _seller,  uint _price){
        buyer = _buyer;
        seller = _seller;
        price = _price * ( 1 ether );
    }

    function initcontract() escrowNotStarted public {
        if(msg.sender == buyer){
            isBuyerIn = true;
        }
        if(msg.sender == seller){
            isSellerIn = true;
        }

    }

    function deposit() onlyBuyer public payable {
        require(currentSate == State.AWAITING_PAYMENT, "Already paid");
        require(msg.value == price, "Wrong deposit amount");
        currentSate = State.AWAITING_DELIVERY;
    }

    function confirmDelivery() onlyBuyer payable public {
        require(currentSate == State.AWAITING_DELIVERY, "Connot confirm delivery");
        seller.transfer(price);
        currentSate = State.COMPLETE;
    }

    function withdraw() onlyBuyer payable public {
        require(currentSate == State.AWAITING_DELIVERY, "Cannot withdraw at this stage");
        payable(msg.sender).transfer(price);
        currentSate = State.COMPLETE;

    }


}