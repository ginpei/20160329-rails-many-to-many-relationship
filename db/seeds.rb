Tag.create([
  { id:1, name: 'Flesh' },
  { id:2, name: 'Recommend' }
])
tunaSushi = Item.create(
  { id: 1, name: 'Tuna Sushi' }
)
tunaSushi.tags << Tag.find(1)
