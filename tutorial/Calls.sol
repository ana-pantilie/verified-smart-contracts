pragma solidity ^0.5.0;

contract Cafe { // at 0xcafe
  function make(bytes memory what) public returns (uint) { return 0xc0ffee; }
  function () external payable {}
}

contract Person {
  function getCoffee() public payable returns (uint) {
    return Cafe(0xcafe).make("latte");
  }
  function sendMoney() public {
    address(0xcafe).send(16);
  }
  function transferMoney() public {
    address(0xcafe).transfer(16);
  }
}
