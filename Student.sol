//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.5.0;

contract question3{

    address public owner;
    struct Student{
        string name;
        uint age;
        uint marks;
        string gender;
        uint class;
    }

    mapping(address => Student) stdData;
    address[] stdArr;

    constructor(){
        owner=msg.sender;
    }

    modifier onlyowner{
        require(msg.sender == owner, "ONLY OWNER IS ALLOWED!!");
        _;
    }

    function addStudent(string calldata _n, uint _a, uint _m, string memory _g, uint _c, address _add)public onlyowner{
        stdData[_add].name =_n;
        stdData[_add].age =_a;
        stdData[_add].marks =_m;
        stdData[_add].gender =_g;
        stdData[_add].class =_c;
        stdArr.push(_add);

    }

    function getStudentData(address _std)public view returns(string memory, uint, uint, string memory, uint){
        return(stdData[_std].name, stdData[_std].age, stdData[_std].marks, stdData[_std].gender, stdData[_std].class);
    }


    function getHighestMarks()public view returns(uint){
        Student[] storage detailsHighest;
        uint256 highest =0;
        uint i;
        for(i=0; i<stdArr.length; i++){
            if(stdArr[i] > highest){
                highest = stdArr[i];
                detailsHighest.push[stdData[stdArr[i]]];
            }
        }
        return detailsHighest;
    }

    function getLowestMarks()public view returns(uint){
        Student[] storage detailsLowest;
        uint256 lowest =0;
        uint i;
        for(i=0; i<stdArr.length; i++){
            if(stdArr[i]< lowest){
                lowest = stdArr[i];
                detailsLowest.push[stdData[stdArr[i]]];
            }

        }
        return detailsLowest;
    }








    
}