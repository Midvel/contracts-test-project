// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.7;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    /// @notice Storage variable documentation example.
    uint256 public storagevar;

    constructor() ERC20("MyToken", "MTKN") {}

    /// @notice Mints desired amount of tokens for the recepient
    /// @param _receiver Receiver of the tokens.
    /// @param _amount Amount (in wei - smallest decimals)
    function mintFor(address _receiver, uint256 _amount) external {
        require(_receiver != address(0), "Zero address");
        require(_receiver != address(this), "Incorrect address");
        require(_amount > 0, "Incorrect amount");
        _mint(_receiver, _amount);
    }

    /// @notice Mints desired amount of tokens for the recepient
    /// @param _amount Amount (in wei - smallest decimals)
    function mint(uint256 _amount) external {
        require(_amount > 0, "Incorrect amount");
        _mint(_msgSender(), _amount);
    }
}
