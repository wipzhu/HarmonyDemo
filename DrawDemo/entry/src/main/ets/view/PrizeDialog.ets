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

import matrix4 from '@ohos.matrix4';
import PrizeData from '../viewmodel/PrizeData';
import StyleConstants from '../common/constants/StyleConstants';
import CommonConstants from '../common/constants/CommonConstants';

@CustomDialog
export default struct PrizeDialog {
  @Link prizeData: PrizeData;
  @Link enableFlag: boolean;
  private controller?: CustomDialogController;
  tryAgain?: () => void;

  build() {
    Column() {
      Image(this.prizeData.imageSrc !== undefined ? this.prizeData.imageSrc : '')
        .width($r('app.float.dialog_image_size'))
        .height($r('app.float.dialog_image_size'))
        .margin({
          top: $r('app.float.dialog_image_top'),
          bottom: $r('app.float.dialog_image_bottom')
        })
        .transform(matrix4.identity().rotate({
          x: 0,
          y: 0,
          z: 1,
          angle: CommonConstants.TRANSFORM_ANGLE
        }))

      Text(this.prizeData.message)
        .fontSize($r('app.float.dialog_font_size'))
        .textAlign(TextAlign.Center)
        .margin({ bottom: $r('app.float.dialog_message_bottom') })

      Row() {
        Button($r('app.string.text_confirm'))
          // .backgroundColor(Color.Green)
          .type(ButtonType.Capsule)
          .height($r('app.float.dialog_button_height'))
          .width($r('app.float.dialog_button_width'))
          .margin({ bottom: $r('app.float.dialog_message_bottom'), right: $r('app.float.dialog_message_bottom')})
          .onClick(() => {
            this.controller?.close();
            this.enableFlag = !this.enableFlag;
          })

        Button($r('app.string.text_try_again'))
          .backgroundColor(Color.Orange)
          .type(ButtonType.Capsule)
          .height($r('app.float.dialog_button_height'))
          .width($r('app.float.dialog_button_width'))
          .margin({ bottom: $r('app.float.dialog_message_bottom'), left: $r('app.float.dialog_message_bottom')})
          .onClick(() => {
            this.controller?.close();
            this.enableFlag = !this.enableFlag;
            this.tryAgain()
          })
      }
      .align(Alignment.Center)
      .justifyContent(FlexAlign.SpaceBetween)
      // .padding(10)
      .layoutWeight(1)

    }
    .backgroundColor($r('app.color.dialog_background'))
    .width(StyleConstants.FULL_PERCENT)
    .height($r('app.float.dialog_height'))
  }
}