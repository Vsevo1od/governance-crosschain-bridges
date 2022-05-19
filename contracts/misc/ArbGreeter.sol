// SPDX-License-Identifier: AGPL-3.0
pragma solidity 0.7.5;
pragma abicoder v2;

import './../dependencies/arbitrum/AddressAliasHelper.sol';

contract ArbGreeter {
  event Senders(address msgSender, address applyAlias, address undoAlias);

  event MessageUpdated(string newMessage);
  string public message;

  constructor() {}

  function setMessage(string calldata newMessage) public {
    message = newMessage;
    emit MessageUpdated(newMessage);
  }

  function sender() public {
    emit Senders(
      msg.sender,
      AddressAliasHelper.applyL1ToL2Alias(msg.sender),
      AddressAliasHelper.undoL1ToL2Alias(msg.sender)
    );
  }
}