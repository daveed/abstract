class DiscussionService
  def self.create(discussion:, author:)
    discussion.author = author
    discussion.save!
  end
end
