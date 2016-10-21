require 'rails_helper'

describe DiscussionService do
  let(:user) { create(:user) }
  let(:discussion) { create(:discussion, author: user) }

  describe '#create' do
    it 'saves the discussion' do
      expect(discussion).to receive(:save!)
      DiscussionService.create(discussion: discussion, author: user)
    end
  end

end
