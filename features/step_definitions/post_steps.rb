Given /^a post exists with title: "([^"]*)"$/ do |given_title|
  Post.create!(:title => given_title)
end

Then /^"([^"]*)" post should exist$/ do |num_posts|
# get the number of posts that exists currently
# compare to the number passed through here

  Post.all.length.should == num_posts.to_i
end