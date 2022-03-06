// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

import "./KhargoshBreed.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract Khargosh is KhargoshBreed, ERC721 {
    address feedToken = 0x123;
    uint256 minFeed = 10;
}
