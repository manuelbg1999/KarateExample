#language En

  Feature: update users


  Background:
* def TokenId = '7d15030cb55b5df9de9e9bbdcde859c8ffb951f4927d766303d98021d5d2427b'
* def payloadInvalid =
"""
    {
    "namee":"manuel32333",
    "emaile":"manuel45334334654@gmail.com",
    "gendere":"male",
    "status":"Active",

    }
    """


  Scenario: Update user invalid body
    * call read("../get/getuser.feature@getespecific")
    Given url 'https://gorest.co.in/public/v2/users/' + id
    And request payloadInvalid
    And header Authorization = 'Bearer ' + TokenId
    When method put
    Then status 400
    And print response

    Scenario: Update user valid body
      * call read("../get/getuser.feature@getespecific")
      Given url 'https://gorest.co.in/public/v2/users/' + id
      And request json
      And header Authorization = 'Bearer ' + TokenId
      When method put
      Then status 200
      And print response