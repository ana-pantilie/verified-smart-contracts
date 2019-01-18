pragma solidity ^0.5.0;

contract ExternalContract6 {

    function isValidSignature(
        bytes calldata _data,
        bytes calldata _signature)
        external
        returns (bytes32 x)
    {
        x = "str12345";
    }
}
