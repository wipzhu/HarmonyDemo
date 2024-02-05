import ItemCategory from './ItemCategory'
import RecordItem from './RecordItem'
export default class GroupInfo {
  /**
   * 分组类型
   */
  type: ItemCategory
  /**
   * 组内数据集合
   */
  items: RecordItem[]

  /**
   * 组内记录的总热量
   */
  calorie: number = 0

  constructor(type: ItemCategory, items: RecordItem[]) {
    this.type = type
    this.items = items
  }
}