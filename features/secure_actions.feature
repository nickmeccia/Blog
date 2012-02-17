Feature: Updating posts
	
	As an admin
	I want to change and create posts
	when I visit the website

	Background:
		Given "1" admin exists
		And I am on the sign in page
		And I fill in "Email" with "nickmeccia@gmail.com"
		And I fill in "Password" with "nickisawesome"
		And I press "Sign in"
		
	Scenario: create a valid post
		Given I am on the home page
		When I follow "New Post"
		And I fill in "Title" with "New Post"
		And I fill in "Body" with "Some Content"
		And I press "Create"
		Then "1" post should exist

	Scenario: create a valid post
		Given I am on the home page
		When I follow "New Post"
		And I fill in "Title" with "New Post"
		And I fill in "Body" with "Some Content"
		And I press "Create"
		Then I should be on the home page
		
	Scenario: delete a post
		Given a post exists with title: "asdf"
		And I am on the home page
		When I click the "Destroy" link for the post with title "asdf"
		Then I am on the home page
		And There is no post with title: "asdf"
		
	Scenario: edit a post
		Given a post exists with title: "Old Title"
		And I am on the home page
		When I click the "Edit" link for the post with title "Old Title"
		And I fill in "Title" with "New Title"
		And I press "Update Post"
		Then I should be on the home page
		And "1" post should exist with title: "New Title"
		And no post exists with title "Old Title"