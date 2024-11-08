//SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../src/Fundme.sol";

contract FundMeTest is Test {
    FundMe fundMe;

    function setUp() external {
        // setup function always gets executed first
        fundMe = new FundMe();
    }

    function testMinimuDollarIsFive() public view {
        assertEq(fundMe.MINIMUM_USD(), 5e18);
    }
}
