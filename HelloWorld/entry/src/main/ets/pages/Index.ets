import router from '@ohos.router'
import RouterInfo from '../viewmodel/RouterInfo'
import RouterItem from '../views/RouterItem'
import IndexFontSizePanel from  '../views/IndexFontSizePanel'
import PreferencesUtil from '../common/util/PreferencesUtil'

const routers: RouterInfo[] = [
  new RouterInfo('pages/LoginPage', '登录页面'),
  // new RouterInfo('pages/ImagePage', '图片查看案例'),
  // new RouterInfo('pages/ItemPage', '商品列表案例'),
  // new RouterInfo('pages/StatePage', 'Jack和他的女友案例'),
  // new RouterInfo('pages/PropPage', '任务列表案例'),
  // new RouterInfo('pages/AnimationPage', '小鱼动画案例按钮版'),
  // new RouterInfo('pages/AnimationPage2', '小鱼动画案例摇杆版'),
  // new RouterInfo('pages/LifeCirclePage', '生命周期案例1'),
  // new RouterInfo('pages/TestPage1', '生命周期案例2'),
  // new RouterInfo('pages/DocumentListPage', 'UIAbility启动模式案例'),
  new RouterInfo('pages/ShopPage', '查询商铺案例'),
  new RouterInfo('pages/TaskManagePage', '任务列表持久化'),
  new RouterInfo('pages/NotificationPage', '系统通知案例'),
]

@Entry
@Component
struct Index {

  @State message: string = '页面列表'
  @State showPanel: boolean = false
  @Provide fontSize: number = 16

  async aboutToAppear() {
    this.fontSize = await PreferencesUtil.getPreference('MyPreferences', 'IndexFontSize', 16) as number
  }

  build() {
    Column() {
      // 顶部标题
      this.Title()

      // 导航列表
      this.RouterList()

      // 字体修改面板
      if(this.showPanel){
        IndexFontSizePanel()
          .transition({
            translate: { y: 115 }
          })
      }
    }
    .width('100%')
    .height('100%')
  }

  @Builder
  Title() {
    Row() {
      Text(this.message)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .height(80)
      Image($r('app.media.ic_public_settings'))
        .width(30)
        .onClick(() => {
          animateTo({ duration: 200, curve: Curve.EaseOut }, () => {this.showPanel = !this.showPanel})
          // animateTo({ duration: 500, curve: Curve.EaseOut }, () => this.showPanel = !this.showPanel)
        })
    }
    .justifyContent(FlexAlign.SpaceAround)
    .width('100%')
  }

  @Builder
  RouterList() {
    List({ space: 15 }) {
      ForEach(
        routers,
        (router, index) => {
          ListItem() {
            RouterItem({ r: router, i: index + 1 })
          }
        }
      )
    }
    .layoutWeight(1)
    .alignListItem(ListItemAlign.Center)
    .width('100%')
  }



  //   Row() {
  //     Column() {
  //       Text(this.message)
  //         .fontSize(28)
  //         .fontWeight(FontWeight.Bold)
  //
  //       Blank()
  //       Button('Next')
  //         .onClick(() => {
  //           router.pushUrl({
  //             url: 'pages/SecondPage',
  //             params: {
  //               textMsg:"你好，世界！"
  //             }
  //           })
  //         })
  //     }
  //     .width('100%')
  //
  //   }
  //   .height('100%')
}