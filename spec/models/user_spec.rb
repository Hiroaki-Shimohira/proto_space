require 'rails_helper'
describe User do
	describe '#create' do
		it "is valid with all information" do
	    	user = create(:user)
	    	expect(user).to be_valid
	    end
		it 'is invalid without nickname' do
			user = build(:user, nickname: "")
			user.valid?
			expect(user.errors[:nickname]).to include("can't be blank")
		end
		it 'is invalid without email' do
			user = build(:user, email: "")
			user.valid?
			expect(user.errors[:email]).to include("can't be blank")
		end
		it 'is invalid without password' do
			user = build(:user, password: "")
			user.valid?
			expect(user.errors[:password]).to include("can't be blank")
		end
		it 'is invalid with a password that has less than 6 characters' do
			user = build(:user, password: "0")
			user.valid?
			expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
		end
		it "is invalid with a duplicate email address" do
	      user = create(:user)
	      another_user = build(:user, email: user.email)
	      another_user.valid?
	      expect(another_user.errors[:email]).to include("has already been taken")
	    end
	end
end