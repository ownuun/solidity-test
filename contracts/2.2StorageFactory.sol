// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./2.1IDStorage.sol";

contract StorageFactory{
    IDStorage[] public idContracts;

    function createIDStorage() public{
        IDStorage newStorage = new IDStorage();
        idContracts.push(newStorage);
    }

    function storeID(uint256 index, string memory name, uint256 number)public{
        IDStorage target = idContracts[index];
        target.setID(name, number);
    }

    function getStoredID(uint256 index, string memory name) public view returns(uint256){
        return idContracts[index].getID(name);
    }

}