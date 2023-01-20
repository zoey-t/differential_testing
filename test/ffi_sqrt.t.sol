// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "@openzeppelin/contracts/utils/math/Math.sol";

import {Strings} from "@openzeppelin/contracts/utils/Strings.sol";

// import "../src/Counter.sol";

contract ffi_sqrt is Test {
    using Strings for uint256;

    function setUp() public {}

    function test_sqrt(uint256 n) public {
        uint256 oz_res = Math.sqrt(n);
        uint256 python_res = sqrt_python(n);
        assertApproxEqRel(oz_res, python_res, 1e17); // 1e17/1e18 = 0.1 => 10%
            // assertApproxEqAbs(oz_res, python_res, 5, "exceed error tolerance: 5");
            // assertEq(oz_res, python_res);
    }

    function sqrt_python(uint256 n) public returns (uint256 sqrt_res) {
        string[] memory inputs = new string[](4);
        inputs[0] = "python";
        inputs[1] = "python/sqrt.py";
        inputs[2] = "--n";
        inputs[3] = n.toString();
        bytes memory res = vm.ffi(inputs);
        sqrt_res = abi.decode(res, (uint256));
    }
}
