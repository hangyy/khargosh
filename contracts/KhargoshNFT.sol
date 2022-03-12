// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "./KhargoshBase.sol";

contract KhargoshNFT is KhargoshBase, ERC721 {
    constructor(address _feedToken) ERC721("Khargosh", "KHA") {
        feedToken = _feedToken;
    }

    modifier onlyOwnerOf(uint256 _khargoshId) {
        require(msg.sender == ownerOf(_khargoshId));
        _;
    }

    /**
        ERC721 function
     */
    function mint(string memory _name) public {
        uint256 id = _createRandomKhargosh(_name);
        _safeMint(msg.sender, id);
    }

    function breed(uint256 _khargoshId, string memory _name) public {
        uint256 id = _breedKhargosh(_khargoshId, _name);
        _safeMint(msg.sender, id);
    }
}
