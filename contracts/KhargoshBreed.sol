// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

import "./KhargoshFactory.sol";
import "@openzeppelin/contracts/interfaces/IERC20.sol";

contract KhargoshBreed is KhargoshFactory {
    address feedToken = 0x123;
    uint256 minFeed = 10;

    modifier onlyOwnerOf(uint256 _khargoshId) {
        require(msg.sender == khargoshToOwner[_khargoshId]);
        _;
    }

    function breedKhargosh(uint256 _khargoshId, string memory _name) internal {
        Khargosh storage myKhargosh = khargoshs[_khargoshId];
        uint256 randDna = _generateRandomDna(_name);
        uint256 newDna = (myKhargosh.dna + randDna) / 2;
        _createKhargosh(_name, newDna);
    }

    function feedOnKhargosh(uint256 _khargoshId, string memory _name)
        public
        onlyOwnerOf(_khargoshId)
    {
        IERC20(feedToken).transferFrom(msg.sender, address(this), minFeed);
        feedAndMultiply(_khargoshId, _name);
    }
}
