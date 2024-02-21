import { CommonConstants } from '../../common/constants/CommonConstants'
import promptAction from '@ohos.promptAction'

@Component
export default struct SearchHeader {
  build() {
    Row({ space: CommonConstants.SPACE_6 }) {
      Search({ placeholder: '搜索饮食或运动信息' })
        .textFont({ size: 18 })
        .layoutWeight(1)
      //角标
      Badge({ count: 2, position: BadgePosition.RightTop, style: { fontSize: 12 } }) {
        Image($r('app.media.ic_public_email'))
          .width(25)
      }
      .onClick(() => {
        promptAction.showToast({
          message: '功能待实现'
        })
      })
    }
    .width(CommonConstants.THOUSANDTH_940)
  }
}