Given /^the following articles exist:$/ do |article_table|
  article_table.hashes.each do |article|
    author = article[:author]
    author_id = User.find_by_name(author).id
    article[:user_id] = author_id
    Article.create! article
  end
end

When /^I merge with "(.*)"$/ do |article|
  step 'I fill in "merge_id" with "' + article + '"'
  step 'I press "Merge"'
end
