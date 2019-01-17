
pragma solidity ^0.5.0;

contract ExternalContract2 {

    function isValidSignature(
        bytes calldata _data)
        external
        returns (bool isValid)
    {
        isValid = false;
    }
}
