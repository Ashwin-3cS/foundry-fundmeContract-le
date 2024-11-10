// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

import {Script} from "../lib/forge-std/src/Script.sol";
import {FundMe} from "../src/Fundme.sol";

contract DeployFundMe is Script {
    function run() external {
        vm.startBroadcast();
        new FundMe();
        vm.stopBroadcast();
    }
}
