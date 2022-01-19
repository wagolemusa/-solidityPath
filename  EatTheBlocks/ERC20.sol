// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

import 'Token.sol';

contract TransferToken {

    // Transfer tokens
    function transfer() external {
        Token token = Token(0x0711ECE2864E029BD4Cc1E88E98Edf1965FB0004);
        token.transfer(msg.sender, 100);
    }

    function transferFrom(address recipient, uint amount) external {
        Token token = Token(0x0711ECE2864E029BD4Cc1E88E98Edf1965FB0004);
        token.transferFrom(msg.sender, recipient, amount);
    }
}

contract Owner {
    function transfer(address recipient, uint amount) external {
        Token token = Token(0x0711ECE2864E029BD4Cc1E88E98Edf1965FB0004);
        token.approve(0x0711ECE2864E029BD4Cc1E88E98Edf1965FB0004,amount);
        TransferToken transferToken = TransferToken(0x0711ECE2864E029BD4Cc1E88E98Edf1965FB0004);
        transferToken.transferFrom(recipient, amount);
    }
}