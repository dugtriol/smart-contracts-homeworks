// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

contract Storage {
    struct Student {
        string login;
        string name;
        uint age;
    }

    event NewStudentAdd(string _login, string _name, uint _age);

    mapping (string => Student) public students;

    function addStudent(string memory _login, string memory _name, uint _age) public {
        Student memory newStudent = Student(
            _login, 
            _name, 
            _age
        );
        students[newStudent.login] = newStudent;

        emit NewStudentAdd(newStudent.login, newStudent.name, newStudent.age);
    }

    function removeStudent(string memory _login) public {
        delete students[_login];
    }
}
      