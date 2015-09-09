require 'spec_helper'

describe Category do
  it { should have_many(:videos) }

  describe "#recent_videos" do
    it "returns the videos in the reverse chronical order by created at" do
      category = Category.create(name: "category")
      video1 = Video.create(title: "video1", description: "video1 desc", category: category, created_at: 1.day.ago)
      video2 = Video.create(title: "video2", description: "video2 desc", category: category)
      expect(category.recent_videos).to eq([video2, video1])
    end
    it "returns all the videos if there are less than 6 videos" do
      category = Category.create(name: "category")
      video1 = Video.create(title: "video1", description: "video1 desc", category: category)
      video2 = Video.create(title: "video2", description: "video2 desc", category: category)
      expect(category.recent_videos.count).to eq(2)
    end
    it "returns 6 videos if there are more than 6 videos" do
      category = Category.create(name: "category")
      7.times{ Video.create(title: "video", description: "video desc", category: category) }
      expect(category.recent_videos.count).to eq(6)
    end
    it "returns the most recent 6 videos" do
      category = Category.create(name: "category")
      6.times{ Video.create(title: "video", description: "video desc", category: category) }
      old_video = Video.create(title: "old video", description: "old video desc", category: category, created_at: 1.day.ago)
      expect(category.recent_videos).not_to include(old_video)
    end
    it "returns an empty array if the category does not have any videos" do
      category = Category.create(name: "category")
      expect(category.recent_videos).to eq([])
    end
  end
end