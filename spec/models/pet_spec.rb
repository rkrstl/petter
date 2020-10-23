require 'rails_helper'
RSpec.describe Pet, type: :model do
  before do
    @pet = FactoryBot.build(:pet)
  end

  describe 'ペットを登録'
    context 'ペットを登録できる' do
      it ""
        
      end
      it ""
      end
      it ""
      end
      it ""
      end
    end

    context 'ペットを登録できない時' do
      it "動物の種類を登録しなければならない" do
        @pet.animal_type=""
        @pet.valid?
        expect(@pet.errors.full_messages).to include("Animal type can't be blank")
      end

      it "ペットの名前は空では登録できない" do
        @pet.pet_name=""
        @pet.valid?
        expect(@pet.errors.full_messages).to include("Pet name can't be blank")
      end

      it "コメントを書かないと登録できない" do
        @pet.personality=""
        @pet.valid?
        expect(@pet.errors.full_messages).to include("Personality can't be blank")
      end

      it "生年月日を登録しなければならない" do
        @pet.birth=""
        @pet.valid?
        expect(@pet.errors.full_messages).to include("Birth can't be blank")
      end
    end
  end
end