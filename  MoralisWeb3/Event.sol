// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

contract SmartEvents {

    uint public checked_in_users = 0;
    uint public amountStaked = 0;
    uint public eventCount = 0;
    // address public payable event_owner;


    struct 
    struct Events {
        uint id,
        string title,
        string description,
        uint started_event_time,
        uint ended_event_time,
    }

    // List stores the vets created
    Events[] public events;

    

    // Method to create events
    function createEvent(string memory _title, string memory _description, uint _started_event_time, uint _ended_event_time) public {

        events.push(Events(_title, _description, _started_event_time, _ended_event_time));
        eventCount += 1;
    }

    // user check in here 
    function check_in(adderss _checked_in, amount) public payable {


    }

    // this function it scan users who have shown up to the event
    // and add there addresses to list called scaned
    function scan(adderss) public{

    }

    // this function only admin should end time for the event
    // and all checked in user recieves there cash

    function endEndTime() public  payable{


    }

}



// near create-account app.djrefuge12.testnet --masterAccount djrefuge12.testnet

// near deploy --wasmFile   --accountId app.djrefuge12.testnet
