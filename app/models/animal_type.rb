class AnimalType < ActiveHash::Base

  self.data = [
    { id: 1, name: 'イヌ' },
    { id: 2, name: 'ネコ' },
    { id: 3, name: 'その他' }
  ]
end
