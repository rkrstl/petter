class Gender < ActiveHash::Base
  
  self.data = [
    { id: 1,name:"おんなのこ" },
    { id:2,name:"おとこのこ" },
    { id:3,name:"その他" }
  ]
end
