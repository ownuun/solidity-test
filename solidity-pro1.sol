// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

contract Birthday {
    mapping(string => string) public birthday;

    function set(string memory name, string memory date) public {
        birthday[name] = date;
    }

    function get(string memory name) public view returns (string memory) {
        return birthday[name];
    }
}
