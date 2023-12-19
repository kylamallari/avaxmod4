// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts@4.9.0/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.9.0/access/Ownable.sol";

contract Degentoken is ERC20, Ownable {
    event Purchase(address indexed buyer, string item, uint256 cost, uint256 quantity);

    struct ShopItem {
        string productName;
        uint256 priceInTokens;
        uint256 availableQuantity;
    }

    mapping(string => ShopItem) public shopItems;

    constructor() ERC20("DegenToken", "DGN") {}

    function mintTokens(address recipient, uint256 amount) external onlyOwner {
        _mint(recipient, amount);
    }

    function burnTokens(uint256 amount) external onlyOwner {
        _burn(msg.sender, amount);
    }

    function customTransfer(address to, uint256 amount) external returns (bool) {
        _transfer(_msgSender(), to, amount);
        return true;
    }

    function setShopItem(string memory itemName, uint256 price, uint256 quantity) external onlyOwner {
        require(price > 0, "Price must be greater than zero");
        require(quantity > 0, "Quantity must be greater than zero");

        ShopItem storage newItem = shopItems[itemName];
        newItem.productName = itemName;
        newItem.priceInTokens = price;
        newItem.availableQuantity = quantity;
    }

    function purchaseItem(string memory itemName, uint256 quantity) external {
        require(quantity > 0, "Quantity must be greater than zero");

        ShopItem storage item = shopItems[itemName];
        require(item.availableQuantity >= quantity, "Not enough quantity available for purchase");

        uint256 totalCost = item.priceInTokens * quantity;
        require(totalCost <= balanceOf(msg.sender), "Insufficient funds");

        _burn(msg.sender, totalCost);
        item.availableQuantity -= quantity;

        emit Purchase(msg.sender, itemName, item.priceInTokens, quantity);
    }
}
