#Language En
#Easy

  Feature: get users using the method get method


    Background:
      * def TokenId = '7d15030cb55b5df9de9e9bbdcde859c8ffb951f4927d766303d98021d5d2427b'


    @getid
     Scenario: Get all users
       Given url 'https://gorest.co.in/public/v2/users/'
      When method get
      And header Authorization = 'Bearer' + TokenId
      Then status 200
      And  def iduser = response[0].id
      And print iduser

    Scenario: Get specific users
      * call read("../get/getuser.feature@getid")
      Given url 'https://gorest.co.in/public/v2/users/?id=' + iduser
      And print iduser
      When method get
      And header Authorization = 'Bearer' + TokenId
      Then status 200
      And print response



    Scenario: Get all users not Token
      Given url 'https://gorest.co.in/public/v2/users/'
      When method get
      Then status 200
      And print response




