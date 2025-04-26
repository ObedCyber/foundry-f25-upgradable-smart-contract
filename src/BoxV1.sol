// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {UUPSUpgradeable} from "@openzeppelin/contracts-upgradeable/contracts/proxy/utils/UUPSUpgradeable.sol";
import {Initializable} from "@openzeppelin/contracts-upgradeable/contracts/proxy/utils/Initializable.sol";
import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/contracts/access/OwnableUpgradeable.sol";

/**
 * Proxy contracts don't use constructors, so we use an initializer function instead.
 * This function is called when the contract is deployed behind a proxy.
 * The initializer function is called only once, so we can use it to set the initial state of the contract.
 * Proxy -> deploy implementation contract -> call initializer function
 * The initializer function is called only once, so we can use it to set the initial state of the contract.
 */

contract BoxV1 is Initializable, UUPSUpgradeable, OwnableUpgradeable {
    uint256 internal number;

    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {       
        // this doesn't allow any initialization
        // it's almost like not having a constructor
        _disableInitializers();
    }

    // A contract can only be initialized once
    function initialize() public initializer {
        __Ownable_init(msg.sender); // setting owner = msg.sender
        __UUPSUpgradeable_init();
    }

    function getNumber() public view returns (uint256) {
        return number;
    }

    function version() external pure returns (uint) {
        return 1;
    }

    /** must be override */
    function _authorizeUpgrade(address newImplementation) internal override {}

}