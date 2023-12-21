# avaxmod4

## Overview

The DegenToken Smart Contract is a Solidity contract that implements an ERC-20 token and a simple decentralized marketplace. This contract allows users to mint, burn, transfer tokens, and purchase items from a predefined shop.

## Features

- **ERC-20 Token:** Implements the ERC-20 standard with the token name "DegenToken" and symbol "DGN."
- **Ownership:** Utilizes the Ownable contract to ensure that certain functions can only be executed by the contract owner.
- **Minting and Burning:** Provides functions for the owner to mint and burn tokens.
- **Custom Transfer:** Allows for custom token transfers between addresses.
- **Decentralized Marketplace:** Users can purchase items from the marketplace using DegenTokens.

## Usage

### Mint Tokens

The owner of the contract can mint new tokens by calling the `mintTokens` function, specifying the recipient's address and the amount of tokens to mint.

```solidity
function mintTokens(address recipient, uint256 amount) external onlyOwner {
    // Implementation details...
}
```

### Burn Tokens

The owner can burn tokens by calling the `burnTokens` function, specifying the amount of tokens to burn.

```solidity
function burnTokens(uint256 amount) external onlyOwner {
    // Implementation details...
}
```

### Custom Transfer

Users can perform custom token transfers using the `customTransfer` function.

```solidity
function customTransfer(address to, uint256 amount) external returns (bool) {
    // Implementation details...
}
```

### Set Shop Item

The owner can add or update shop items using the `setShopItem` function, specifying the item name, price, and quantity.

```solidity
function setShopItem(string memory itemName, uint256 price, uint256 quantity) external onlyOwner {
    // Implementation details...
}
```

### Purchase Item

Users can purchase items from the shop using the `purchaseItem` function, specifying the item name and quantity.

```solidity
function purchaseItem(string memory itemName, uint256 quantity) external {
    // Implementation details...
}
```

## Events

- **Purchase:** Fired when a user successfully purchases an item from the shop.

```solidity
event Purchase(address indexed buyer, string item, uint256 cost, uint256 quantity);
```
