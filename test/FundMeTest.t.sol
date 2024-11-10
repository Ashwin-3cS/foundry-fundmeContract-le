//SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../src/Fundme.sol";

contract FundMeTest is Test {
    FundMe fundMe;

    function setUp() external {
        // setup function always gets executed first
        // by calling new FundMe(). Since FundMe is deployed within this test contract,
        // the deployer of FundMe will be the FundMeTest contract itself.
        fundMe = new FundMe();
    }

    function testMinimuDollarIsFive() public view {
        assertEq(fundMe.MINIMUM_USD(), 5e18);
    }

    function testOwnerIsMsgsender() public view {
        assertEq(fundMe.i_owner(), address(this));
        // assertEq(fundMe.i_owner(), msg.sender); it fails because msg.sender is not the owner ; contract is the owner see the comments(above) to get more info
    }
}
