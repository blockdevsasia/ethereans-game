pragma solidity ^0.4.18;

contract EthereanFactory {

    // declare our event here
    event EthereanCreated(uint id, string _name, uint _dna);

    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    struct Etherean {
        string name;
        uint dna;
    }

    Etherean[] public Ethereans;

    function _createEtherean(string _name, uint _dna) private {
        uint id = Ethereans.push(Etherean(_name, _dna));
        EthereanCreated(id, _name, _dna);
    } 

    function _generateRandomDna(string _str) private view returns (uint) {
        uint rand = uint(keccak256(_str));
        return rand % dnaModulus;
    }

    function createRandomEtherean(string _name) public {
        uint randDna = _generateRandomDna(_name);
        _createEtherean(_name, randDna);
    }

}
