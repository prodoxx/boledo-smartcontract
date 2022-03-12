// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "hardhat/console.sol";
import "./BoledoHelper.sol";

contract Bolido is Ownable, BoledoHelper {
    uint public nextDrawTime;
    uint private durationBetweenDraws = 12 hours;
    address public operator;
    Session[] public sessions;

    struct Session {
        uint8[2]winningNumbers;
        bool hasPlayed;
        address[] winners;
        uint poolSize;
    }

    struct Ticket {
        uint sessionId;
        address purchaser;
        uint8[2] numbers;
        uint amount;
    }

    mapping(uint => Ticket[]) public sessionPurchases;

    constructor(address _operator) public {
        operator = _operator;
        nextDraw = block.timestamp + durationBetweenDraws;
        sessions.push(Session([],false,[],0)); 
    }

    // TODO: allow users to bet on a number x amount of times (a positive integer);


    function draw() external isOperator {
        require(block.timestamp >= nextDrawTime, "Not time yet to draw");
        Session storage currentSession = sessions[sessions.length - 1];
        uint[2] memory winningNumbers = pickTwoRandomNumbers();
        // TODO: find winning tickets;

        // TODO: calculate winning amount for each winning ticket from the pool

        // TODO: update session

        // TODO: create new session

        // TODO: update the nextDrawTime
    }

    modifier isOperator() {
        require(msg.sender == operator, "Not authorized");
        _;
    }
}
