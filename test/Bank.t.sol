// SPDX-License-Identifier: MIT

pragma solidity 0.8.13;

import "forge-std/Test.sol";
import "../src/Bank.sol";

contract BankTest is Test {
    Bank public bankContract;

    event Increase(uint256 total);
    event Decrease(uint256 total);
    event SetA(uint256 a);

    function setUp() public {
        bankContract = new Bank();
    }

    function testAdd() public {
        vm.expectEmit(false, false, false, true);
        emit Increase(1);

        assertEq(bankContract.total(), 0);
        bankContract.add();
        assertEq(bankContract.total(), 1);
    }

    function testSub() public {
        vm.expectEmit(false, false, false, true);
        emit Increase(1);
        emit Decrease(0);

        bankContract.add();
        assertEq(bankContract.total(), 1);
        bankContract.sub();
        assertEq(bankContract.total(), 0);
    }

    function testCannotSub() public {
        vm.expectRevert(stdError.arithmeticError);

        bankContract.sub();
    }

    function testSetAAsOwner() public {
        vm.expectEmit(false, false, false, true); // 1,2,3 เป็น indexed args แล้วค่อย 4 เป็น args ปกติ
        emit SetA(100);

        assertEq(bankContract.a(), 0);
        bankContract.setA(100);
        assertEq(bankContract.a(), 100);
    }

    function testCannotSetAAsNotOwner() public {
        vm.expectRevert(InvalidInput.selector);
        vm.prank(address(0));
        bankContract.setA(0);
    }
}
