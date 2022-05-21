// SPDX-License-Identifier: MIT

pragma solidity 0.8.13;

error InvalidInput();

contract Bank {
    uint256 public total;
    uint256 public a;

    event Increase(uint256 total);
    event Decrease(uint256 total);
    event SetA(uint256 a);

    function add() external {
        total++;

        emit Increase(total);
    }

    function sub() external {
        total--;

        emit Decrease(total);
    }

    function setA(uint256 _a) external {
        if (_a == 0) {
            revert InvalidInput();
        }

        a = _a;

        emit SetA(a);
    }
}
