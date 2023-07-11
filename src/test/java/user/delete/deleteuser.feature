 #language en

   Feature:  delete user

   Background:

 * def TokenId = '7d15030cb55b5df9de9e9bbdcde859c8ffb951f4927d766303d98021d5d2427b'



 Scenario: delete new user
 * call read("../get/getuser.feature@getespecific")
 Given url 'https://gorest.co.in/public/v2/users/' + id
 And print id
 And header Authorization = 'Bearer ' + TokenId
 When method Delete
 Then status 204
 And print response
