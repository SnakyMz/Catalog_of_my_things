require './classes/label'
require './classes/item'

describe Label do
  item = Item.new('2010-10-11')
  label = Label.new('Important', 'Red')

  context do
    # add item to the label.items
    label.add_item(item)

    it 'The item should be present in label' do
      compare = label.items[0] == item
      expect(compare).to be true
    end
  end
end