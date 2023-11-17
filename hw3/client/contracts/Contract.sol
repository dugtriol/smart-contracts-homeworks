// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract Contract {
    struct User {
        string login;
        uint age;
        bool isWorking;
    }

    event NewUserAdd(string _login, uint _age, bool _isWorking);
    event UserDelete(string _login, uint _age, bool _isWorking);

    mapping(string => User) public users;

    function addUser(string memory _login, uint _age, bool _isWorking) public {
        User memory newUser = User(_login, _age, _isWorking);
        users[newUser.login] = newUser;

        emit NewUserAdd(newUser.login, newUser.age, newUser.isWorking);
    }

    function removeUser(string memory _login) public {
        emit UserDelete(_login, users[_login].age, users[_login].isWorking);
        delete users[_login];
    }
}
