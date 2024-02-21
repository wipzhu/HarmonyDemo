import { CommonConstants } from '../../common/constants/CommonConstants'
import RecordItem from '../../viewmodel/RecordItem'
import ItemModel from '../../model/ItemModel'
import GroupInfo from '../../viewmodel/GroupInfo'
import ItemCategory from '../../viewmodel/ItemCategory'

@Component
export default struct ItemList {
  showPanel: (item: RecordItem) => {}
  @Prop isFood:boolean
  @State currentIndex: number = 0;

  build() {
    Tabs() {
      TabContent() {
        this.TabContentBuilder(ItemModel.list(this.isFood))
      }.tabBar('全部')

      ForEach(ItemModel.listItemGroupByCategory(this.isFood),
        (group: GroupInfo<ItemCategory, RecordItem>) => {
          TabContent() {
            this.TabContentBuilder(group.items)
          }.tabBar(group.type.name)
        })
    }
    .barMode(BarMode.Scrollable)
    .width(CommonConstants.THOUSANDTH_940)
    .height('100%')
  }

  @Builder TabContentBuilder(items: RecordItem[]) {

    List() {
      ForEach(items, (item: RecordItem) => {
        ListItem() {
          // 2.组内记录列表
          Row({ space: CommonConstants.SPACE_6 }) {
            Image(item.image).width(50)
            Column({ space: CommonConstants.SPACE_4 }) {
              Text(item.name).fontWeight(CommonConstants.FONT_WEIGHT_500)
              Text(`${item.calorie}千卡/${item.unit}`).grayText()
            }
            .alignItems(HorizontalAlign.Start)

            Blank()
            Image($r('app.media.ic_public_add_norm_filled')).width(24).fillColor($r('app.color.primary_color'))
          }
          .width('100%')
          .padding(CommonConstants.SPACE_6)
          .onClick(() => this.showPanel(item))
        }
      })
    }
    .width(CommonConstants.THOUSANDTH_1000)
    .height(CommonConstants.THOUSANDTH_1000)
    .padding({ top: CommonConstants.SPACE_12, bottom: CommonConstants.SPACE_12 })
  }
}

@Extend(Text) function grayText() {
  .fontSize(14).fontColor($r('app.color.light_gray'))
}