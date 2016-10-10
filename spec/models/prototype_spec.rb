require 'rails_helper'

describe Prototype do
	before do
      @prototype = create(:prototype)
    end
	describe "associations" do
		describe "with comments" do
			it "deletes comments when prototype is deleted" do
				comment = attributes_for(:comment)
				@prototype.comments.create(comment)
				expect{ @prototype.destroy }.to change{ Comment.count }.by(-1)
	        end
	    end
	    describe "with likes" do
	        it "deletes likes when prototype is deleted" do
				like = attributes_for(:like)
				@prototype.likes.create(like)
				expect{ @prototype.destroy }.to change{ Like.count }.by(-1)
	        end
		end
		describe "with capture_image" do
			it "has many capture_images" do
				capture_image = build(:capture_image, :main, :image, prototype: @prototype)
				expect(capture_image.prototype).to eq @prototype
			end
		end
		describe "with user" do
			it "belongs_to user" do
				prototypes = create_list(:prototype, 3)
				user = build(:user, prototypes: prototypes)
				expect(user.prototypes).to eq prototypes
			end
		end
	end
	describe "validations" do
		describe "without valid attributes" do
			it "is missing title" do
				prototype = build(:prototype , title:"")
				prototype.valid?
				expect(prototype.errors[:title]).to include("can't be blank")
			end
		end
		describe "with valid attributes" do
			it "has valid factory" do
				prototype = build(:prototype)
				expect(prototype).to be_valid
			end
		end
	end
	describe "liked_by?(user)" do
		describe "when liked by a user" do
			it "returns true" do
				like = attributes_for(:like)
				@prototype.likes.create(like)
				expect(@prototype.likes).to be_truthy
			end
		end
		describe "when not liked by a user" do
			it "returns nil" do
				expect(@prototype.likes).to eq []
			end
		end
	end
end
