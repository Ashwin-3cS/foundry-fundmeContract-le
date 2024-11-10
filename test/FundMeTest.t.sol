//SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../src/Fundme.sol";
import {DeployFundMe} from "../script/DeployFundMe.s.sol";

contract FundMeTest is Test {
    FundMe fundMe;

    function setUp() external {
        // setup function always gets executed first
        // by calling new FundMe(). Since FundMe is deployed within this test contract,
        // the deployer of FundMe will be the FundMeTest contract itself.
        // fundMe = new FundMe(0x694AA1769357215DE4FAC081bf1f309aDC325306);  (instead of manually pasing in the address in deploy script and as well in test ; making it modular in below line)
        DeployFundMe deployFundMe = new DeployFundMe();
        fundMe = deployFundMe.run();
    }

    function testMinimuDollarIsFive() public view {
        assertEq(fundMe.MINIMUM_USD(), 5e18);
    }

    function testOwnerIsMsgsender() public view {
        console.log(msg.sender);
        console.log(address(this)); // forge test -vv (to run the test because we used two log's so two vv's)
        // assertEq(fundMe.i_owner(), address(this));
        // assertEq(fundMe.i_owner(), msg.sender); it fails because msg.sender is not the owner ; contract is the owner see the comments(above) to get more info
        assertEq(fundMe.i_owner(), msg.sender); // after refactoring this works beacause DeplyFundMe is deploying the contract
    }

    function testPriceFeedVersionIsAccurate() public view {
        uint256 version = fundMe.getVersion();
        console.log(version);
        assertEq(version, 4);
    }
}
