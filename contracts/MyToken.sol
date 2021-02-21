// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.6.12;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {

    constructor() public ERC20("MyToken", "MTKN") {
        _setupDecimals(2);
    }

    /**
     * @notice Mints desired amount of tokens for the recepient
     * @param _receiver Receiver of the tokens.
     * @param _amount Amount (in wei - smallest decimals)
     */
    function mintFor(address _receiver, uint256 _amount) external {
        require(_receiver != address(0), "Zero address");
        require(_receiver != address(this), "Incorrect address");
        require(_amount > 0, "Incorrect amount");
        _mint(_receiver, _amount);
    }

    function mint(uint256 _amount) external {
        require(_amount > 0, "Incorrect amount");
        _mint(_msgSender(), _amount);
    }
}