// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract KhargoshFactory is Ownable {
    using SafeMath for uint256;
    event NewKhargosh();
    event NewBreedKhargosh();

    struct Khargosh {
        string name;
        uint256 dna;
    }

    uint256 dnaDigits = 16;
    uint256 dnaModulus = 10**dnaDigits;

    Khargosh[] public khargoshs;
    mapping(uint256 => address) public khargoshToOwner;
    mapping(address => uint256) ownerKhargoshCount;

    function _createKhargosh(string memory _name, uint256 _dna) internal {
        uint256 id = khargoshs.push(Khargosh(_name, _dna)) - 1;
        khargoshToOwner[id] = msg.sender;
        ownerKhargoshCount[msg.sender] = ownerKhargoshCount[msg.sender].add(1);
        emit NewKhargosh(id, _name, _dna);
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

    function createRandomKhargosh(string memory _name) public {
        require(ownerKhargoshCount[msg.sender] == 0);
        uint256 randDna = _generateRandomDna(_name);
        randDna = randDna - (randDna % 100);
        _createKhargosh(_name, randDna);
    }
}
