// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "./KhargoshBase.sol";

contract KhargoshNFT is KhargoshBase, ERC721 {
    constructor() ERC721("Khargosh", "KHA") {
        _baseTokenURI = "ipfs://xxx";
    }

    modifier onlyOwnerOf(uint256 _khargoshId) {
        require(msg.sender == khargoshToOwner[_khargoshId]);
        _;
    }

    /**
        ERC721 function
     */
    function mint(name) public {
        id = _createRandomKhargosh(_name);
        _safeMint(msg.sender, id);
    }

    function breed(uint256 _khargoshId, string memory _name) public {
        id = _breedKhargosh(_khargoshId, _name);
        _safeMint(msg.sender, id);
    }
}
