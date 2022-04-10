// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

contract GameTime {

    uint public countPlayers = 0;

    mapping(address => Player) public players;

    enum Level { Novice, Intermediate, Advanced}

    struct Player {
        address playerAddress;
        Level playerLevel1;
        string firstname;
        string lastname;
        uint createdTime;
    }

    function addPlayer(string memory firstname,  string memory lastname) public {
        // players.push(Players(firstname, lastname));
        players[msg.sender] = Player(msg.sender, Level.Novice, firstname, lastname, block.timestamp);
        countPlayers += 1;
    }

    
    function getPlayerLavel(address playerAddress) public view returns(Level){
        Player storage player = players[playerAddress];
        return player.playerLevel1;
    }

    function ChangePlayerLavel(address playerAddress) public {
        Player storage player = players[playerAddress];
        if(block.timestamp >= player.createdTime + 20){
            player.playerLevel1 = Level.Intermediate;
        }
    }


}