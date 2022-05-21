// SPDX-License-Identifier: MIT

pragma solidity 0.8.13;

import "ds-test/test.sol";
import "../src/StakeContract.sol";
import "./mocks/MockERC20.sol";

contract StakeContractTest is DSTest {
    StakeContract public stakeContract;
    MockERC20 public mockERC20;

    function setUp() public {
        stakeContract = new StakeContract();
        mockERC20 = new MockERC20();
    }

    function testExample() public {
        uint256 amount = 10e18;
        mockERC20.approve(address(stakeContract), amount);
        bool stakePassed = stakeContract.stake(amount, address(mockERC20));
        assertTrue(stakePassed);
    }
}
