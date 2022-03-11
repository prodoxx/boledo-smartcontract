// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <=0.8.4;

import "@openzeppelin/contracts/access/Ownable.sol";
import "hardhat/console.sol";

contract Bolido is Ownable {

    uint32 public epochLength;
    uint32 public nextEpochTime;
    
    address operator;

    constructor(address _operator, uint32 _epochLength) public {
        operator = _operator;
        epochLength = _epochLength;
    }

    function random() private view returns(uint){
         return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp)));
    }

    function pickTwoRandomNumbers() internal returns(uint[2] memory) {
        uint _numberOne = random() % 9;
        uint _numberTwo = random() % 9;

        uint[2] memory _numbers = [_numberOne, _numberTwo];
        return _numbers;
    }

    function draw() public isOperator returns(uint[2] memory) {
        uint[2] memory _winningNumbers = pickTwoRandomNumbers();
        return _winningNumbers;
    }

    modifier isOperator() {
        require(msg.sender == operator, "Not authorized");
        _;
    }
}
