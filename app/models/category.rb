class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'メンズ' },
  ]

  include ActiveHash::Associations
  has_many :items
  end