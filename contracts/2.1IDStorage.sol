// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IDStorage{
    mapping(string => uint256) private idNumbers;

    function setID(string memory name, uint256 number) public{
        require(number>=100000&&number<=999999);
        idNumbers[name] = number;
    }

    function getID(string memory name) public view returns(uint256){
        return idNumbers[name];
    }
}