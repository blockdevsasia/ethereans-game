/*
@dev Hello BlockChain Dev Manila, 
this is my primary proposal for the ERC721 Altar that will summon an Etherean with the corresponding ownership payload.
It includes the amount of ETH offering on the altar which can bw used as a modifier for traits or reduce a randomness of a trait.
Maybe in the future we can discuss what will be the traits(payload) that we can include on an Etherean.
*/
pragma solidity ^0.4.18;

import "../node_modules/zeppelin-solidity/contracts/lifecycle/Pausable.sol";
import "../node_modules/zeppelin-solidity/contracts/token/ERC721/ERC721Token.sol";


contract Ethereans is ERC721Token, Pausable {

    string public constant name = "Ethereans";
    string public constant symbol = "ETHN";
    address public wallet;

    /*** DATA TYPES Please ***/
    struct Token {
        address mintedBy;
        uint64 mintedAt;
        uint256 value;
    }

    /*** STORAGE ***/
    Token[] public tokens;

    mapping (uint256 => address) public tokenIndexToOwner;
    mapping (address => uint256) ownershipTokenCount;
    mapping (uint256 => address) public tokenIndexToApproved;

    function Ethereans () public {
        wallet = msg.sender;
    }

    // fallback function can be used to buy tokens
    function () external payable {
        buyTokens(msg.sender);
    }

    function buyTokens(address beneficiary) public payable {
        require(beneficiary != address(0));
        require(validPurchase());

        // @dev creates an Etherean with corresponding value equal to the amount of ETH sacrified in the Altar.

        mint(beneficiary, msg.value);
        forwardFunds(); // @dev offer the sacrifies to the Gods.
    }

    function mint(address _to, uint256 value) internal returns (uint256 _tokenId) {
        // @dev adds a payload and the amount paid to summon an Etherean
        Token memory token = Token ({
            mintedBy: _to,
            mintedAt: uint64(now),
            value: value
        });

        _tokenId = tokens.push(token) - 1;
        super._mint(_to, _tokenId);
    }    

    function burn(uint256 _tokenId) public {
        super._burn(_tokenId);
    }

    function forwardFunds() internal {
        wallet.transfer(msg.value);
    }

    function validPurchase() internal view returns (bool) {
        bool nonZeroPurchase = msg.value != 0;
        return nonZeroPurchase;
    }

}