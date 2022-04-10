// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

contract GameTime {

    uint public playerCount = 0;
    uint public pot = 0; // this where the jonner can send ther Ether
    address public dealer; // The owner  address of the game

    Player[] public playerInGame; // Store all players in the game

    mapping(address => Player) public players;

    enum Level { Novice, Intermediate, Advanced}

    struct Player {
        address playerAddress;
        Level playerLevel1;
        string firstname;
        string lastname;
        uint createdTime;
    }

    constructor(){
        dealer = msg.sender;
    }

    function addPlayer(string memory firstname,  string memory lastname) public {
        Player memory newPlayer = Player(msg.sender, Level.Novice, firstname, lastname, block.timestamp);
        players[msg.sender] = newPlayer;
        playerInGame.push(newPlayer);
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

    function joinGame(string memory firstname, string memory lastname) payable public{
        require(msg.value == 25 ether, "The joining free is 25 ether");
        if (payable(dealer).send(msg.value)){
            playerCount += 1;
            pot += 25;
        }
    }

    function payOutWinners(address loserAddress) payable public{
        require(msg.sender == dealer, "Only the dealer can payout the winners.");
        require(msg.value == pot * (1 ether));
        uint payoutPerWinner = msg.value / (playerCount -1);
        for (uint i=0; i < playerInGame.length; i++){
            address currentPlayerAddress = playerInGame[i].playerAddress;
            if  (currentPlayerAddress != loserAddress){
                payable(currentPlayerAddress).transfer(payoutPerWinner);
            }
        }

    }


}