pragma solidity ^0.5.10;

import {IKeep} from '../../../contracts/interfaces/IKeep.sol';

contract KeepStub {

    mapping (bytes32 => uint256) approved;
    bool success = true;
    uint256 bondAmount = 10000;
    address keepAddress = address(7);
    bytes pubkey = hex"00";

    function () payable external {}

    function setPubkey(bytes memory _pubkey) public {pubkey = _pubkey;}
    function setSuccess(bool _success) public {success = _success;}
    function setBondAmount(uint256 _bondAmount) public {bondAmount = _bondAmount;}
    function setKeepAddress(address _id) public {keepAddress = _id;}
    function setDigestApprovedAtTime(bytes32 _digest, uint256 _timestamp) public {approved[_digest] = _timestamp;}

    function wasDigestApprovedForSigning(address _keepAddress, bytes32 _digest) external view returns (uint256) {
        _keepAddress;
        return approved[_digest];
    }

    function approveDigest(address _keepAddress, bytes32 _digest) external returns (bool _success) {
        _keepAddress;
        approved[_digest] = 100;
        _success = success;
    }

    function submitSignatureFraud(
        address _keepAddress,
        uint8 _v,
        bytes32 _r,
        bytes32 _s,
        bytes32 _signedDigest,
        bytes calldata _preimage
    ) external returns (bool _isFraud) {
        _keepAddress; _v; _r; _s; _signedDigest; _preimage; success = success;
        _isFraud = success;
    }

    function distributeEthToKeepGroup(address _keepAddress) external payable returns (bool) {
        _keepAddress;
        return success;
    }

    function distributeERC20ToKeepGroup(address _keepAddress, address _asset, uint256 _value) external returns (bool) {
        _keepAddress; _asset; _value; success = success;
        return success;
    }

    function getKeepPubkey(address _keepAddress) external view returns (bytes memory) {
        _keepAddress; success;
        // this is the pubkey coresponding to 32 '11' bytes
        if (keccak256(pubkey) != keccak256(hex"00")) {
            return pubkey;
        }
        return hex"4f355bdcb7cc0af728ef3cceb9615d90684bb5b2ca5f859ab0f0b704075871aa385b6b1b8ead809ca67454d9683fcf2ba03456d6fe2c4abe2b07f0fbdbb2f1c1";
    }


    function checkBondAmount(address _keepAddress) external view returns (uint256) {
        _keepAddress;
        return bondAmount;
    }

    function seizeSignerBonds(address _keepAddress) external returns (bool) {
        _keepAddress;
        if (address(this).balance > 0) {
            msg.sender.transfer(address(this).balance);
        }
        return true;
    }

    function burnContractBalance() public {
        address(0).transfer(address(this).balance);
    }
}
