// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Carrot is ERC20 {
    constructor(address initialAccount) ERC20("Carrot", "CRT") {
        _mint(initialAccount, 10**9 * 10**18);
    }
}
