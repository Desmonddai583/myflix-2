require 'spec_helper'

describe Video do
  it { should belong_to(:category) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }

  describe "#search_by_title" do
    it "returns an empety arry if there is no match" do
      video1 = Video.create(title: "video1", description: "video1 desc")
      video2 = Video.create(title: "video2", description: "video2 desc")
      expect(Video.search_by_title("test")).to eq([])
    end
    it "returns an arry of one video for an exact match" do
      video1 = Video.create(title: "video1", description: "video1 desc")
      video2 = Video.create(title: "video2", description: "video2 desc")
      expect(Video.search_by_title("video1")).to eq([video1])
    end
    it "returns an arry of one video for an partail match" do
      video1 = Video.create(title: "video1a", description: "video1 desc")
      video2 = Video.create(title: "video2a", description: "video2 desc")
      expect(Video.search_by_title("video1")).to eq([video1])
    end
    it "returns an arry of all match ordered by created_at" do
      video1 = Video.create(title: "video1", description: "video1 desc", created_at: 1.day.ago)
      video2 = Video.create(title: "video2", description: "video2 desc")
      expect(Video.search_by_title("video")).to eq([video2, video1])
    end
    it "returns an empety arry for a search with an empty string" do
      video1 = Video.create(title: "video1", description: "video1 desc")
      video2 = Video.create(title: "video2", description: "video2 desc")
      expect(Video.search_by_title("")).to eq([])
    end
  end
end