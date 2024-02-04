import UserPrivacyDialog from '../view/welcome/UserPrivacyDialog'
import common from '@ohos.app.ability.common'
import promptAction from '@ohos.promptAction'
import PreferenceUtil from '../common/utils/PreferenceUtil'
import router from '@ohos.router'

const USER_PRIVACY_KEY = 'user_privacy_key'

@Entry
@Component
struct WelcomePage {
  @State message: string = 'Hello World'
  context = getContext(this) as common.UIAbilityContext

  controller: CustomDialogController = new CustomDialogController({
    builder: UserPrivacyDialog({
      confirm: () => this.onConfirm(),
      cancel: () => this.onCancel()
    })
  })

  async aboutToAppear() {
    // 加载首选项
    let isAgree = await PreferenceUtil.getPreferenceValue(USER_PRIVACY_KEY, false)
    // 判断是否同意过隐私协议
    if (isAgree) {
      // 同意，跳转首页
      this.jumpToIndex()
    } else {
      // 不同意，弹窗
      this.controller.open()
    }
  }

  onConfirm() {
    promptAction.showToast({
      message:this.message
    })
    // 保存首选项
    PreferenceUtil.putPreferenceValue(USER_PRIVACY_KEY, true)
    // 跳转到首页
    this.jumpToIndex()
  }

  onCancel() {
    // 退出应用
    this.context.terminateSelf()
  }

  jumpToIndex() {
    //延迟跳转
    setTimeout(() => {
      router.replaceUrl({
        url: 'pages/Index'
      })
    }, 1000)
  }

  build() {
    Column({ space: 10 }) {
      // 中央slogan
      Row() {
        Image($r('app.media.home_slogan'))
          .width(260)
      }.layoutWeight(1)

      // logo
      Image($r('app.media.home_logo'))
        .width(150)

      // 文字描述
      Row() {
        Text("Wipzhu健康支持").opacityWhiteText(12, 0.8).margin({ right: 3 })
        Text("IPv6")
          .opacityWhiteText(14, 0.8)
          .border({ style: BorderStyle.Solid, width: '1vp', radius: 10, color: Color.White })
          .padding({ left: 5, right: 5 })
        Text("网络").opacityWhiteText(14, 0.8).margin({ left: 3 })
      }

      Text(`'减更多'希望通过软件工具的形式，帮助更多用户实现身材管理`).opacityWhiteText(12, 0.6)
      Text(`浙ICP备0000000号-36D`).opacityWhiteText(12, 0.5)
        .margin({ bottom: 35 })

    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.welcome_page_background'))
    // .padding({ top: 100, bottom: 20 })
    // .justifyContent(FlexAlign.SpaceBetween)
  }
}

@Extend(Text) function opacityWhiteText(fontSize: number = 10, opacity: number) {
  .fontSize(fontSize).opacity(opacity).fontColor(Color.White)
}