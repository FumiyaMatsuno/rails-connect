class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '設計' },
    { id: 3, name: 'Ruby' },
    { id: 4, name: 'Rails' },
    { id: 5, name: 'GitHub' },
    { id: 6, name: 'RSpec' },
    { id: 7, name: 'JavaScript' },
    { id: 8, name: 'Ajax' },
    { id: 9, name: 'クレジット機能' },
    { id: 10, name: 'デプロイ' },
    { id: 11, name: 'AWS' },
    { id: 12, name: 'その他' }
  ]
end