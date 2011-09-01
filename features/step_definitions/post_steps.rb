Given /^a post exists with title: "([^"]*)"$/ do |given_title|
  Post.create!(:title => given_title)
end

Then /^"([^"]*)" post should exist$/ do |num_posts|
  # get the number of posts that exists currently
  # compare to the number passed through here
  Post.all.length.should == num_posts.to_i
end

When /^I click the "([^"]*)" link for the post with title "([^"]*)"$/ do |link, title|
  # find the post with :title => title
  post_id = Post.where(:title => title).first.id
  # might not need the first # sign below
  within("#post_#{post_id}") do
    click_link(link)
  end
end

Then /^There is no post with title: "([^"]*)"$/ do |title|
  Post.exists?(:title => title).should == false
end