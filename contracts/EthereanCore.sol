pragma solidity ^0.4.19;

import "../node_modules/zeppelin-solidity/contracts/lifecycle/Pausable.sol";
import "../node_modules/zeppelin-solidity/contracts/token/ERC721/ERC721Token.sol";


contract EthereanCore is ERC721Token, Pausable {

    string public constant name = "Ethereans";
    string public constant symbol = "ETHN";

    address public contractOwner;

    event NewEtherean(
        uint EthereanId,
        address summonedBy,
        uint256 dna,
        uint256 level,
        uint64 summonedAt
    );

    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;
    uint cooldownTime = 1 days;

    struct Etherean {
        address summonedBy;
        uint256 dna;
        uint256 level;
        uint64 summonedAt;
    }

    Etherean[] public ethereans;

    /// @dev A mapping from etherean IDs to the address that owns them. All ethereans have
    ///  some valid owner address.
    mapping (uint256 => address) public ethereanIndexToOwner;

    // @dev A mapping from owner address to count of tokens that address owns.
    //  Used internally inside balanceOf() to resolve ownership count.
    mapping (address => uint256) ownershipTokenCount;

    function EthereanCore () public {
        contractOwner = msg.sender;
        
    }

    function () external payable {
        makeOffering(msg.sender);
    }

    function makeOffering(address _summoner) public payable {
        // Make sure the beneficiary is not null
        require(_summoner != address(0));

        // Make sure the amount sent is valid
        require(validPurchase());

        // Create an Etherean with corresponding value equal to the amount of ETH sacrified in the Altar.
        summon(_summoner, msg.value);

        // Offer the sacrifies to the Gods.
        forwardFunds();
    }


    function summon(address _to, uint256 _etherOffered) internal returns (uint256 _tokenId) {
        // @dev adds a payload and the amount paid to summon an Etherean
        Etherean memory etherean = Etherean ({
            summonedBy: _to,
            dna: 0, // TODO: Set DNA
            level: _etherOffered,
            summonedAt: uint64(now)
            });

        uint256 _ethereanId = ethereans.push(etherean) - 1;
        super._mint(_to, _ethereanId);
        return _ethereanId;
    }


    function forwardFunds() internal {
        contractOwner.transfer(msg.value);
    }

    function validPurchase() internal view returns (bool) {
        bool nonZeroPurchase = msg.value != 0;
        return nonZeroPurchase;
    }

}
