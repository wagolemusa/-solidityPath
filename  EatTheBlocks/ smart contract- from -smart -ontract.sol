// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;
// Create a child contract
// Store child contract address
// cast contract pointer to address
// Caveat when admin is contract

contract LoanFactory {

    Loan[] loans;
    function createLoan() external {
        Loan loan = new Loan(100);
        loans.push(loan);
        address(loan);

        loan.reimburse();
    }

    function withdraw(){
        loan.withdraw();
    }
}

contract Loan {
    uint public amount;
    address admin;
    constructor(uint _amount) public {
        amount = _amount;
        admin = msg.sender;
    }

    function withdraw() external {
        // withdraw same ether

    }

    function reimburse() external {

    }
}