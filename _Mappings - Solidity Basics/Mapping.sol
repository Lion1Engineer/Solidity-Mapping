//SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.0;

contract Mapping{

    mapping (address => bool) public registered;//We create a mapping that points to bool values ​​from Adress values.
    mapping (address => int256) public favNums;// Keeps the number of favorites of the registered user

    function register(int256 _favNum) public
    {
        require(!registered[msg.sender], "Your user is not registered");
        //It allows us to perform the registration operation once.
        require(!isRegistered(), "Your user is not registered");
        registered[msg.sender]=true;
        // To access the values ​​of registered mapping, we write the key value we want to access in parentheses.
        favNums[msg.sender] = _favNum;
    }

    //Reading data directly from mapping

    function isRegistered() public view returns(bool)
    {
        return registered[msg.sender];
    }

    //Deleting value from mapping

    function deleteRegistered() public
    {
        require (isRegistered(), "Your user is not registered");
        delete(registered[msg.sender]);
        delete(favNums[msg.sender]);

    }
}

    //Another representation of mapping

    contract NestedMapping
    {
        mapping(address => mapping(address => uint256)) public debts;
    // We can assign another mapping to the value value without changing the key value of a mapping.
    // An example showing our own address, the other party's address and the value of the debt owed to us

        function incDebt(address _borrower, uint256 _amount) public 
        {
            // Address and amount of debt owed to me
            debts [msg.sender][_borrower] += _amount;
        }

        function decDebt(address _borrower, uint256 _amount) public 
        {
            //We use require to avoid errors when entering a debt amount greater than the current debt amount.
            require(debts[msg.sender][_borrower] >= _amount, "Not enough debt.");
            debts [msg.sender][_borrower] -= _amount;
        }

        function getDebt(address _borrower) public view returns (uint256)
        {
            return debts [msg.sender] [_borrower];
        }
    }