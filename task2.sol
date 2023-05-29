//SPDX-License-Identifier:MIT
pragma solidity 0.8.18;
contract sendEther{
    struct people{
        address userAddress;
        string name;
        string email;
    }
    mapping(address=>people) private usr;
    address[] private userAdrs;
    function donateEther() external payable{
        require(msg.value>=0.01 ether, "Given value is less than 0.01 ether");
        people memory user = usr[msg.sender];
        user.userAddress = msg.sender;
    }
    function input_user(string memory name, string memory email) public{
        people storage user = usr[msg.sender];
        user.name = name;
        user.email = email;
        if(user.userAddress==address(0)){
            user.userAddress = msg.sender;
            userAdrs.push(msg.sender);
        }
    }
    function get_usr(address userAddress) public view returns (string memory name,string memory email){
        people storage user = usr[userAddress];
        return (user.name, user.email);
    }
    function get_users_address() public view returns (address[] memory){
        return userAdrs;
    }
}
