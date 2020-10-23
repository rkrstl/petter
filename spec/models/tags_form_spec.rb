
require 'rails_helper'
RSpec.describe TagsForm,type: :model do
   before do
     @tweet=FactoryBot.build(:tags_form)
     @tweet.images = fixture_file_upload('IMG_4621.jpeg')
   end


   describe 'tweetの投稿' do
      context '投稿ができる場合' do
      #  it "入力項目が全て揃っていれば投稿できる" do
      #       expect(@tweet.images).to be_valid
      #  end
      end

   context '投稿ができない場合' do
      it "titleがなければ投稿できない" do
            @tweet.title=""
            @tweet.valid?
            expect(@tweet.errors.full_messages).to include("Title can't be blank")
      end

      it "image一枚でもないと保存できない" do
        @tweet.images= nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Images can't be blank")
      end

      it "textがなければ投稿できない" do
        @tweet.text=""
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Text can't be blank")
      end
    end
  end
end



   