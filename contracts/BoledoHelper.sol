// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract BoledoHelper {
    function random() private view returns(uint){
         return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp)));
    }

    function pickTwoRandomNumbers() internal view returns(uint[2] memory) {
        uint numberOne = random() % 9;
        uint numberTwo = random() % 9;

        uint[2] memory numbers = [numberOne, numberTwo];
        return numbers;
    }
}