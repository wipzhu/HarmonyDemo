import ShopInfo from '../viewmodel/ShopInfo'
import ShopItem from '../views/ShopItem'
import ShopModel from '../model/ShopModel'
import prompt from '@ohos.promptAction';

@Entry
@Component
struct ShopPage {
  @State shops: ShopInfo[] = []
  @State isLoading: boolean = false
  @State hasMore: boolean = true

  aboutToAppear() {
    this.loadShopInfo()
  }

  build() {
    Column() {
      // Header({ title: '商铺列表' })
      List({space: 10}) {
        ForEach(this.shops, shop => {
          ListItem() {
            ShopItem({ shop: shop })
          }
        })
      }
      .width('100%')
      .height('100%')
      .layoutWeight(1)
      .onReachEnd(() => {
        console.log("触底了")
        if (!this.hasMore) {
          prompt.showToast({
            message: "我是有底线的~"
          })
        }
        if (!this.isLoading && this.hasMore) {
          this.isLoading = true
          // 翻页
          ShopModel.page_no++
          this.loadShopInfo()
        }
      })
    }
    .width('100%')
    .height('100%')
    .padding(10)
    .backgroundColor('#e1e2e3')

  }

  loadShopInfo() {
    // let shops = [{
    //   id: 1,
    //   name: "这里有一家饭店",
    //   images: [
    //     "/images/design/resource/pic_design_resource_banner_360.jpg",
    //     "/images/design/resource/pic_design_resource_banner_360.jpg",
    //     "/images/design/resource/pic_design_resource_banner_360.jpg"
    //   ],
    //   area: "string",
    //   address: "普陀区友力国际大厦",
    //   avgPrice: 120,
    //   comments: 268,
    //   score: 47,
    //   openHours: "9:00~22:00",
    // }, {
    //   id: 2,
    //   name: "叫了只鸡",
    //   images: [
    //     "/images/design/resource/pic_design_resource_banner_360.jpg",
    //     "/images/design/resource/pic_design_resource_banner_360.jpg",
    //     "/images/design/resource/pic_design_resource_banner_360.jpg"
    //   ],
    //   area: "String2",
    //   address: "静安区静安寺",
    //   avgPrice: 120,
    //   comments: 268,
    //   score: 48,
    //   openHours: "9:00~22:00",
    // }]

    this.isLoading = true

    ShopModel.getShopListByHttp()
      .then(shops => {
        shops.forEach(shop => {
          shop.images.forEach((src, i) => {
            shop.images[i] = "https://developer.huawei.com" + src
          })
        });

        this.shops = this.shops.concat(shops)

        this.isLoading = false
        if (shops.length < ShopModel.page_size) {
          this.hasMore = false

          prompt.showToast({
            message: "我是有底线的~"
          })
        }
      })
      .finally(() => {
        this.isLoading = false
      })
  }
}