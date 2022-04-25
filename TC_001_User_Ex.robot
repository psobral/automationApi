*** Settings ***
Library               RequestsLibrary
#Library               JSONLibrary
Library               Collections

*** Variables ***
${base_url}        https://reqres.in/
${id_user}      2
${id_user_del}      2

*** Test Cases ***
TC_002_User_create 
    ${body}=     create dictionary    name=Paula job=Presidenta updatedAt=2022-04-25T05:17:47.219Z
    ${header}=   create dictionary     Content-Type=application/json
    ${response}=  POST     ${base_url}api/users/${id_user} 
    Log To Console       ${response.status_code}
    Log To Console       ${response.content}
    ${actual_code}=      convert to string  ${response.status_code}
    should be equal     ${actual_code}  201

TC_001_Get_Users_by_id 
    ${response}=  get  ${base_url}api/users/${id_user}  
    Log To Console       ${response.status_code}
    Log To Console       ${response.content}
    ${actual_code}=      convert to string  ${response.status_code}
    should be equal     ${actual_code}  200

TC_002_User_del_id 
    ${response}=  Delete  ${base_url}api/users/${id_user_del} 
    Log To Console       ${response.status_code}
    Log To Console       ${response.content}
    ${actual_code}=      convert to string  ${response.status_code}
    should be equal     ${actual_code}  204
TC_002_User_update_id 
    ${body}=     create dictionary    id=2 name=Paula job=Presidenta updatedAt=2022-04-25T05:17:47.219Z
    ${header}=   create dictionary     Content-Type=application/json
    ${response}=  put     ${base_url}api/users/${id_user_del}  #data=${body}  headers=${header}
    Log To Console       ${response.status_code}
    Log To Console       ${response.content}
    ${actual_code}=      convert to string  ${response.status_code}
    should be equal     ${actual_code}  200
