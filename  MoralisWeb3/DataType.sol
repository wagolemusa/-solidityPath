// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

contract DataType {

    uint public countPlayers = 0;

    mapping(address => Player) public players;

    enum Level { Novice, Intermediate, Advanced}

    struct Player {
        address playerAddress;
        Level playerLevel1;
        string firstname;
        string lastname;
    }

    function addPlayer(string memory firstname,  string memory lastname) public {
        // players.push(Players(firstname, lastname));
        players[msg.sender] = Player(msg.sender, Level.Novice, firstname, lastname);
        countPlayers += 1;
    }

    function getPlayerLavel(address playerAddress) public view returns(Level){
        return players[playerAddress].playerLevel1;
    }


}