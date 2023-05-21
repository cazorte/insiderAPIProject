@pet
  Feature: Using “pet” endpoints from https://petstore.swagger.io/ write CRUD operations API
    tests with positive and negative scenarios.

  Background:
    * def animal = { id: 0, category: {id: 1, name: aass}, name: 'queen', photoUrls: [ 'striiin' ], tags: [ {id: 2, name: zxc} ], status: 'available'   }

    Scenario: Crate
      Given url 'https://petstore.swagger.io/v2'
      When path 'pet'
      And request animal
      And method post
      Then status 200
      And print response