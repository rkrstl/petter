class AnimalType < ActiveHash::Base

  self.data=[
    { id: 1, name: 'イヌ' },
    { id: 2, name: 'ネコ' },
    { id: 6, name: 'その他' }
  ]
end
