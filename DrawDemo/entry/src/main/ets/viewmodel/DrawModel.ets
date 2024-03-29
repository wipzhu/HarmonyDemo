/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import CommonConstants from '../common/constants/CommonConstants';
import { EnumeratedValue } from '../common/constants/CommonConstants';
import ColorConstants from '../common/constants/ColorConstants';
import StyleConstants from '../common/constants/StyleConstants';
import PrizeData from '../viewmodel/PrizeData';
import FillArcData from '../viewmodel/FillArcData';
import Logger from '../common/utils/Logger';
import CheckEmptyUtils from '../common/utils/CheckEmptyUtils';

/**
 * Canvas drawing method class.
 */
export default class DrawModel {
  private startAngle: number = 0;
  private avgAngle: number = CommonConstants.CIRCLE / CommonConstants.COUNT;
  private arcRadius: number = 0;
  private screenWidth: number = 0;
  private screenHeight: number = 0;
  private canvasContext?: CanvasRenderingContext2D;
  private prizePool: Array<object> = []

  /**
   * Draw the raffle round turntable.
   *
   * @param canvasContext canvasContext.
   * @param screenWidth screenWidth.
   * @param screenHeight screenHeight.
   */
  draw(canvasContext: CanvasRenderingContext2D, screenWidth: number, screenHeight: number, prizePool: Array<object>) {
    if (CheckEmptyUtils.isEmptyObj(canvasContext)) {
      Logger.error('[DrawModel][draw] canvasContext is empty.');
      return;
    }
    this.prizePool = prizePool
    this.canvasContext = canvasContext;
    this.screenWidth = screenWidth;
    this.screenHeight = screenHeight;
    this.arcRadius = screenWidth * CommonConstants.INNER_ARC_RATIOS;
    this.canvasContext.clearRect(0, 0, this.screenWidth, this.screenHeight);
    // Translates the canvas along the X and Y axes by a specified distance.
    this.canvasContext.translate(this.screenWidth / CommonConstants.TWO,
      this.screenHeight / CommonConstants.TEN * CommonConstants.THREE);
    // Painted outer disc petal.
    this.drawFlower();
    // Draw outer disc, small circle.
    this.drawOutCircle();
    // Draw the inner disc.
    this.drawInnerCircle();
    // Draw the interior fan-shaped raffle area.
    this.drawInnerArc();
    // Draw text in the internal fan area.
    this.drawArcText();
    // Draw the picture corresponding to the prize in the internal fan area.
    this.drawImage();
    this.canvasContext.translate(-this.screenWidth / CommonConstants.TWO,
      this.screenHeight / CommonConstants.TEN * CommonConstants.THREE);
  }

  /**
   * Method of drawing arcs.
   *
   * @param fillArcData fillArcData.
   * @param fillColor fillColor.
   */
  fillArc(fillArcData: FillArcData, fillColor: string) {
    if (CheckEmptyUtils.isEmptyObj(fillArcData) || CheckEmptyUtils.isEmptyStr(fillColor)) {
      Logger.error('[DrawModel][fillArc] fillArcData or fillColor is empty.');
      return;
    }
    if (this.canvasContext !== undefined) {
      this.canvasContext.beginPath();
      this.canvasContext.fillStyle = fillColor;
      this.canvasContext.arc(fillArcData.x, fillArcData.y, fillArcData.radius,
        fillArcData.startAngle, fillArcData.endAngle);
      this.canvasContext.fill();
    }
  }

  /**
   * Painted outer disc petal.
   */
  drawFlower() {
    let beginAngle = this.startAngle + this.avgAngle;
    const pointY = this.screenWidth * CommonConstants.FLOWER_POINT_Y_RATIOS;
    const radius = this.screenWidth * CommonConstants.FLOWER_RADIUS_RATIOS;
    const innerRadius = this.screenWidth * CommonConstants.FLOWER_INNER_RATIOS;
    for (let i = 0; i < CommonConstants.COUNT; i++) {
      this.canvasContext?.save();
      this.canvasContext?.rotate(beginAngle * Math.PI / CommonConstants.HALF_CIRCLE);
      this.fillArc(new FillArcData(0, -pointY, radius, 0, Math.PI * CommonConstants.TWO),
        ColorConstants.FLOWER_OUT_COLOR);

      this.fillArc(new FillArcData(0, -pointY, innerRadius, 0, Math.PI * CommonConstants.TWO),
        ColorConstants.FLOWER_INNER_COLOR);
      beginAngle += this.avgAngle;
      this.canvasContext?.restore();
    }
  }

  /**
   * Draw outer disc, small circle.
   */
  drawOutCircle() {
    // Draw outer disc.
    this.fillArc(new FillArcData(0, 0, this.screenWidth * CommonConstants.OUT_CIRCLE_RATIOS, 0,
      Math.PI * CommonConstants.TWO), ColorConstants.OUT_CIRCLE_COLOR);

    let beginAngle = this.startAngle;
    // Draw small circle.
    for (let i = 0; i < CommonConstants.SMALL_CIRCLE_COUNT; i++) {
      this.canvasContext?.save();
      this.canvasContext?.rotate(beginAngle * Math.PI / CommonConstants.HALF_CIRCLE);
      this.fillArc(new FillArcData(this.screenWidth * CommonConstants.SMALL_CIRCLE_RATIOS, 0,
        CommonConstants.SMALL_CIRCLE_RADIUS, 0, Math.PI * CommonConstants.TWO),
        ColorConstants.WHITE_COLOR);
      beginAngle = beginAngle + CommonConstants.CIRCLE / CommonConstants.SMALL_CIRCLE_COUNT;
      this.canvasContext?.restore();
    }
  }

  /**
   * Draw the inner disc.
   */
  drawInnerCircle() {
    this.fillArc(new FillArcData(0, 0, this.screenWidth * CommonConstants.INNER_CIRCLE_RATIOS, 0,
      Math.PI * CommonConstants.TWO), ColorConstants.INNER_CIRCLE_COLOR);
    this.fillArc(new FillArcData(0, 0, this.screenWidth * CommonConstants.INNER_WHITE_CIRCLE_RATIOS, 0,
      Math.PI * CommonConstants.TWO), ColorConstants.WHITE_COLOR);
    this.canvasContext?.restore();
  }

  /**
   * Draw the interior fan-shaped raffle area.
   */
  drawInnerArc() {
    let colors = [
    ColorConstants.ARC_PINK_COLOR, ColorConstants.ARC_YELLOW_COLOR,
    ColorConstants.ARC_GREEN_COLOR, ColorConstants.ARC_BLUE_COLOR,
    ColorConstants.ARC_PURPLE_COLOR, ColorConstants.ARC_ORANGE_COLOR,
    ColorConstants.ARC_PINK_COLOR, ColorConstants.ARC_YELLOW_COLOR,
    ColorConstants.ARC_GREEN_COLOR, ColorConstants.ARC_BLUE_COLOR,
    ColorConstants.ARC_PURPLE_COLOR, ColorConstants.ARC_ORANGE_COLOR,
    ];
    for (let i = 0; i < CommonConstants.COUNT; i++) {
      this.fillArc(new FillArcData(0, 0, this.arcRadius, this.startAngle * Math.PI / CommonConstants.HALF_CIRCLE,
        (this.startAngle + this.avgAngle) * Math.PI / CommonConstants.HALF_CIRCLE), colors[i]);
      this.canvasContext?.lineTo(0, 0);
      this.canvasContext?.fill();
      this.startAngle += this.avgAngle;
    }
    this.canvasContext?.restore();
  }

  /**
   * Draw text in the internal fan area.
   */
  drawArcText() {
    if (this.canvasContext !== undefined) {
      this.canvasContext.textAlign = CommonConstants.TEXT_ALIGN;
      this.canvasContext.textBaseline = CommonConstants.TEXT_BASE_LINE;
      this.canvasContext.fillStyle = ColorConstants.TEXT_COLOR;
      this.canvasContext.font = StyleConstants.ARC_TEXT_SIZE + CommonConstants.CANVAS_FONT;
    }
    let arcTextStartAngle = CommonConstants.ARC_START_ANGLE;
    let arcTextEndAngle = CommonConstants.ARC_END_ANGLE;
    for (let i = 0; i < CommonConstants.COUNT; i++) {
      this.drawCircularText(this.prizePool[i]['name'],
        (this.startAngle + arcTextStartAngle) * Math.PI / CommonConstants.HALF_CIRCLE,
        (this.startAngle + arcTextEndAngle) * Math.PI / CommonConstants.HALF_CIRCLE);
      this.startAngle += this.avgAngle;
    }
    this.canvasContext?.restore();
  }

  /**
   * Obtains the character string corresponding to the specified resource ID.
   *
   * @param resource resource.
   */
  getResourceString(resource: Resource): string {
    if (CheckEmptyUtils.isEmptyObj(resource)) {
      Logger.error('[DrawModel][getResourceString] resource is empty.')
      return '';
    }
    let resourceString: string = '';
    try {
      resourceString = getContext(this).resourceManager.getStringSync(resource.id);
    } catch (error) {
      Logger.error(`[DrawModel][getResourceString]getStringSync failed, error : ${JSON.stringify(error)}.`);
    }
    return resourceString;
  }

  /**
   * Draw Arc Text.
   *
   * @param textString textString.
   * @param startAngle startAngle.
   * @param endAngle endAngle.
   */
  drawCircularText(textString: string, startAngle: number, endAngle: number) {
    if (CheckEmptyUtils.isEmptyStr(textString)) {
      Logger.error('[DrawModel][drawCircularText] textString is empty.');
      return;
    }

    class CircleText {
      x: number = 0;
      y: number = 0;
      radius: number = 0;
    }

    let circleText: CircleText = {
      x: 0,
      y: 0,
      radius: this.arcRadius
    };
    // The radius of the circle.
    let radius = circleText.radius - circleText.radius / CommonConstants.COUNT;
    // The radians occupied by each letter.
    let angleDecrement = (startAngle - endAngle) / (textString.length - 1);
    let angle = startAngle;
    let index = 0;
    let character: string;

    while (index < textString.length) {
      character = textString.charAt(index);
      this.canvasContext?.save();
      this.canvasContext?.beginPath();
      this.canvasContext?.translate(circleText.x + Math.cos(angle) * radius,
        circleText.y + Math.sin(angle) * radius);
      this.canvasContext?.rotate(Math.PI / CommonConstants.TWO + angle);
      this.canvasContext?.fillText(character, 0, 0);
      angle -= angleDecrement;
      index++;
      this.canvasContext?.restore();
    }
  }

  /**
   * Draw the picture corresponding to the prize in the internal fan area.
   */
  drawImage() {
    let beginAngle = 0
    for (let i = 0; i < this.prizePool.length; i++) {

      let image = new ImageBitmap(this.prizePool[i]['image_src']);
      this.canvasContext?.save()

      this.canvasContext?.rotate(beginAngle * Math.PI / CommonConstants.HALF_CIRCLE)

      this.canvasContext?.drawImage(image, this.arcRadius * CommonConstants.IMAGE_DX_RATIOS,
        this.arcRadius * CommonConstants.IMAGE_DY_RATIOS, CommonConstants.IMAGE_SIZE,
        CommonConstants.IMAGE_SIZE);

      beginAngle += this.avgAngle

      this.canvasContext?.restore()
    }
  }

  /**
   * Displaying information about prizes.
   *
   * @param randomAngle randomAngle.
   */
  showPrizeData(randomAngle: number): PrizeData {
    for (let i = 1; i <= CommonConstants.COUNT; i++) {
      if (randomAngle <= i * this.avgAngle) {
        return this.getPrizeData(i - 1);
      }
    }
    return new PrizeData();
  }

  /**
   * Obtaining information about prizes.
   *
   * @param scopeNum scopeNum.
   */
  getPrizeData(scopeNum: number): PrizeData {
    let prizeData: PrizeData = new PrizeData();
    prizeData.message = this.prizePool[scopeNum]['tip_message']
    prizeData.imageSrc = this.prizePool[scopeNum]['image_src']
    return prizeData;
  }
}
