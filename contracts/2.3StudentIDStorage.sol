// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./2.1IDStorage.sol";

contract StudentIDStorage is IDStorage{
    function setStudentID(string memory name, uint256 number) public {
        uint256 fullID = uint256(2025000000)+number;
        setID(name,fullID);
    }
}
