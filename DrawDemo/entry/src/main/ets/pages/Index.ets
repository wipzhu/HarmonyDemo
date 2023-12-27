/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import window from '@ohos.window';
import Logger from '../common/utils/Logger';
import DrawModel from '../viewmodel/DrawModel';
import PrizeDialog from '../view/PrizeDialog';
import PrizeData from '../viewmodel/PrizeData';
import StyleConstants from '../common/constants/StyleConstants';
import CommonConstants from '../common/constants/CommonConstants';
import promptAction from '@ohos.promptAction'

// Get context.
let context = getContext(this);

@Entry
@Preview
@Component
struct Index {
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private canvasContext: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);
  @State drawModel: DrawModel = new DrawModel();
  @State screenWidth: number = 0
  @State screenHeight: number = 0
  @State rotateDegree: number = 0
  @State enableFlag: boolean = true
  @State inputName: string = ''
  @State prizeData: PrizeData = new PrizeData(); // 抽中的奖品
  @State prizePool: Array<object> = [] // 奖池
  private prizeInfoMap: Array<object> = [ //奖品信息
    {
      "id": 1,
      "name": "汉堡",
      "tip_message": "恭喜，抽中奖品汉堡",
      "image_src": CommonConstants.HAMBURG_IMAGE_URL,
    },
    {
      "id": 2,
      "name": "蛋糕",
      "tip_message": "恭喜，抽中奖品蛋糕",
      "image_src": CommonConstants.CAKE_IMAGE_URL,
    },
    {
      "id": 3,
      "name": "啤酒",
      "tip_message": "恭喜，抽中奖品啤酒",
      "image_src": CommonConstants.BEER_IMAGE_URL,
    },
    {
      "id": 4,
      "name": "西瓜",
      "tip_message": "恭喜，抽中奖品西瓜",
      "image_src": CommonConstants.WATERMELON_IMAGE_URL,
    },
    {
      "id": 5,
      "name": "谢谢",
      "tip_message": "Sorry,再来一次吧",
      "image_src": CommonConstants.SMILE_IMAGE_URL,
    }
  ]
  // private prizeInfoMap: Array<object> = [ //奖品信息
  //   {
  //     "name": $r('app.string.text_hamburger'),
  //     "tips": $r('app.string.prize_text_hamburger'),
  //     "imgSrc": CommonConstants.HAMBURG_IMAGE_URL,
  //   },
  //   {
  //     "name": $r('app.string.text_cake'),
  //     "tips": $r('app.string.prize_text_cake'),
  //     "imgSrc": CommonConstants.CAKE_IMAGE_URL,
  //   },
  //   {
  //     "name": $r('app.string.text_beer'),
  //     "tips": $r('app.string.prize_text_beer'),
  //     "imgSrc": CommonConstants.BEER_IMAGE_URL,
  //   },
  //   {
  //     "name": $r('app.string.text_watermelon'),
  //     "tips": $r('app.string.prize_text_watermelon'),
  //     "imgSrc": CommonConstants.WATERMELON_IMAGE_URL,
  //   },
  //   {
  //     "name": $r('app.string.text_smile'),
  //     "tips": $r('app.string.prize_text_smile'),
  //     "imgSrc": CommonConstants.SMILE_IMAGE_URL,
  //   }
  // ]
  dialogController: CustomDialogController = new CustomDialogController({
    builder: PrizeDialog({
      prizeData: $prizeData,
      enableFlag: $enableFlag,
      tryAgain: () => {
        this.enableFlag = !this.enableFlag;
        this.startAnimator()
      }
    }),
    autoCancel: false
  });

  aboutToAppear() {
    // Obtains the width and height of the screen, excluding the height of the navigation view.
    window.getLastWindow(context)
      .then((windowClass: window.Window) => {
        let windowProperties = windowClass.getWindowProperties();
        this.screenWidth = px2vp(windowProperties.windowRect.width);
        this.screenHeight = px2vp(windowProperties.windowRect.height);
      })
      .catch((error: Error) => {
        Logger.error('Failed to obtain the window size. Cause: ' + JSON.stringify(error));
      })

    // 填充奖池
    this.fillPrizePool()
  }

  build() {
    Column() {
      Stack({ alignContent: Alignment.Center }) {
        Canvas(this.canvasContext)
          // .backgroundColor(Color.Red)
          .width(StyleConstants.FULL_PERCENT)
          .height(StyleConstants.FULL_PERCENT)
          .onReady(() => {
            this.drawModel.draw(this.canvasContext, this.screenWidth, this.screenHeight, this.prizePool);
          })
          .rotate({
            x: 0,
            y: 0,
            z: 1,
            angle: this.rotateDegree,
            centerX: this.screenWidth / CommonConstants.TWO,
            centerY: this.screenHeight / CommonConstants.TEN * CommonConstants.THREE
          })

        Image($r('app.media.ic_center'))
          .width(StyleConstants.CENTER_IMAGE_WIDTH)
          .height(StyleConstants.CENTER_IMAGE_HEIGHT)
          .enabled(this.enableFlag)
          .onClick(() => {
            this.enableFlag = !this.enableFlag;
            this.startAnimator();
          })
      }
      .width(StyleConstants.FULL_PERCENT)
      .height(StyleConstants.SIXTY_PERCENT)
      .backgroundImage($r('app.media.ic_background'), ImageRepeat.NoRepeat)
      .backgroundImageSize({
        width: StyleConstants.FULL_PERCENT,
        height: StyleConstants.BACKGROUND_IMAGE_SIZE
      })

      // Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceEvenly, alignItems: ItemAlign.Center }) {
      //   TextInput({ placeholder: "点击编辑奖项" })
      //     .width(StyleConstants.EIGHTY_PERCENT)
      //     // .backgroundColor(Color.Green)
      //     .placeholderColor(Color.Gray)
      //     .borderRadius(StyleConstants.INPUT_BORDER_RADIUS)
      //     .onChange((value: string) => {
      //       this.inputName = value;
      //     })
      //
      //   Button("添加")
      //     .type(ButtonType.Normal)
      //     .borderRadius(15)
      //     .width(StyleConstants.TWENTY_PERCENT)
      //     .margin({ left: 20 })
      //     .onClick(() => {
      //       if (this.inputName.length === 0) {
      //         promptAction.showToast({ message: "请输入奖项", bottom: CommonConstants.PROMPT_BOTTOM_MAX });
      //         return false
      //       }
      //       promptAction.showToast({ message: this.inputName, bottom: CommonConstants.PROMPT_BOTTOM_MAX });
      //     })
      //
      // }
      // // .backgroundColor(Color.Blue)
      // .height(StyleConstants.TEN_PERCENT)
      // .padding({ top: 20, left: 10, bottom: 20, right: 10 })
    }
  }

  /**
   * Start animator.
   */
  startAnimator() {
    let randomAngle = Math.round(Math.random() * CommonConstants.CIRCLE);
    this.prizeData = this.drawModel.showPrizeData(randomAngle);

    animateTo({
      duration: CommonConstants.DURATION,
      curve: Curve.Ease,
      delay: 0,
      iterations: 1,
      playMode: PlayMode.Normal,
      onFinish: () => {
        this.rotateDegree = CommonConstants.ANGLE - randomAngle;
        // Display prize information pop-up window.
        this.dialogController.open();
      }
    }, () => {
      this.rotateDegree = CommonConstants.CIRCLE * CommonConstants.FIVE +
      CommonConstants.ANGLE - randomAngle;
    })
  }

  /**
   * 填充奖池
   */
  fillPrizePool() {
    for (let i = 0; i < CommonConstants.COUNT; i++) {
      // 获取一个随机数
      let randomIndex = Math.floor(Math.random() * this.prizeInfoMap.length)
      // console.log("输出随机数：" + randomIndex)
      this.prizePool[i] = this.prizeInfoMap[randomIndex];
    }
  }
}

@Component
export struct prizeItem {
  image_src: string
  name: string

  build() {
    Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
      Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceAround,alignItems: ItemAlign.Center  }) {

        Image(this.image_src)
          .width(30)
          .height(30)
          .alignSelf(ItemAlign.Center)
          .backgroundColor(Color.Blue)

        Text(this.name)
          .fontSize(15)
          .padding(5)
          .textAlign(TextAlign.Center)
          .backgroundColor(Color.Red)

      }
      .width(StyleConstants.SIXTY_PERCENT)
      // .backgroundColor(Color.Blue)

      Button("添加")
        .type(ButtonType.Capsule)
        .fontSize(12)
        .padding(5)
        .width(StyleConstants.TWENTY_PERCENT)
        // .backgroundColor(Color.Red)
    }
    .margin({ top: 2, bottom: 2 })
    // .backgroundColor(Color.Pink)
  }
}