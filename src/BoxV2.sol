// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {UUPSUpgradeable} from "@openzeppelin/contracts-upgradeable/contracts/proxy/utils/UUPSUpgradeable.sol";


contract  BoxV2 is UUPSUpgradeable{
    uint256 internal number;


    function setNumber(uint256 _number) public {
        number = _number;
    }

    function getNumber() public view returns (uint256) {
        return number;
    }

    function version() external pure returns (uint) {
        return 2;
    }

    function _authorizeUpgrade(address newImplementation) internal override {}


}