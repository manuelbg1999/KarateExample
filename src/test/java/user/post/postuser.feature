#language En
Feature: create users

    Background:

    * def TokenId = '7d15030cb55b5df9de9e9bbdcde859c8ffb951f4927d766303d98021d5d2427b'
        * def payload =
        """
    {
    "name":"manuel3233",
    "email":"manuel4534334654@gmail.com",
    "gender":"male",
    "status":"Active",

    }
    """

      @create
      Scenario: create new user
      Given url 'https://gorest.co.in/public/v2/users'
      And request payload
      And header Authorization = 'Bearer ' + TokenId
        When method Post
          Then status 201
          And print response
         And def id = response.id
        And print id


