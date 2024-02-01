import ItemCategory from './ItemCategory'
import RecordItem from './RecordItem'

export default class GroupInfo{
  type: ItemCategory
  items: RecordItem[]

  constructor(type: ItemCategory, items: RecordItem[]) {
    this.type = type
    this.items = items
  }
}