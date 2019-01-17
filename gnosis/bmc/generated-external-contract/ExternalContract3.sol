pragma solidity ^0.5.0;

contract ExternalContract3 {

    function randomFunctionName(
        bytes calldata _data,
        bytes calldata _signature)
        external
        returns (bool isValid)
    {
        isValid = false;
    }
}
