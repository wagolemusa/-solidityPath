// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

library MyLibray {
    struct  Player {
        uint score;
    }
    function increamentScore(Player storage _player, uint points) public {
        _player.score += points;
    }
}

contract MyContract {
    using MyLibray for MyLibray.Player;
    mapping(uint => MyLibray.Player) players;
    function foo() external {
        players[0].increamentScore(10);
    }


}