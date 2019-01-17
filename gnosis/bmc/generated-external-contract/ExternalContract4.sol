pragma solidity ^0.5.0;

contract ExternalContract4 {

    function isValidSignature(
        bytes calldata _data,
        bytes calldata _signature)
        external
        returns (uint256 x)
    {
        x = 12345;
    }
}
