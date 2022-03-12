// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/interfaces/IERC20.sol";

contract KhargoshBase {
    using SafeMath for uint256;

    struct Khargosh {
        string name;
        uint256 dna;
    }

    address feedToken;
    uint256 minFeed = 10;
    uint256 dnaDigits = 16;
    uint256 dnaModulus = 10**dnaDigits;
    Khargosh[] public khargoshs;

    function _createKhargosh(string memory _name, uint256 _dna)
        internal
        returns (uint256)
    {
        khargoshs.push(Khargosh(_name, _dna));
        return khargoshs.length - 1;
    }

    /* 
    NOTE: pseudo random, need ORACLE for truely random number.
    */
    function _generateRandomDna(string memory _str)
        private
        view
        returns (uint256)
    {
        uint256 rand = uint256(keccak256(abi.encodePacked(_str)));
        return rand % dnaModulus;
    }

    function _createRandomKhargosh(string memory _name)
        internal
        returns (uint256)
    {
        uint256 randDna = _generateRandomDna(_name);
        randDna = randDna - (randDna % 100);
        return _createKhargosh(_name, randDna);
    }

    function _breedKhargosh(uint256 _khargoshId, string memory _name)
        internal
        returns (uint256)
    {
        IERC20(feedToken).transferFrom(msg.sender, address(this), minFeed);
        Khargosh storage myKhargosh = khargoshs[_khargoshId];
        uint256 randDna = _generateRandomDna(_name);
        uint256 newDna = (myKhargosh.dna + randDna) / 2;
        return _createKhargosh(_name, newDna);
    }
}
