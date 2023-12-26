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

/**
 * Style constants for all Component.
 */
export default class StyleConstants {
  /**
   * Font weight.
   */
  static readonly FONT_WEIGHT: number = 500;

  /**
   * One hundred percent.
   */
  static readonly FULL_PERCENT: string = '100%';
  /**
   * Ninety percent.
   */
  static readonly NINETY_PERCENT: string = '90%';
  /**
   * Eighty percent.
   */
  static readonly EIGHTY_PERCENT: string = '80%';
  /**
   * Seventy percent.
   */
  static readonly SEVENTY_PERCENT: string = '70%';
  /**
   * Sixty percent.
   */
  static readonly SIXTY_PERCENT: string = '60%';
  /**
   * Fifty percent.
   */
  static readonly FIFTY_PERCENT: string = '50%';
  /**
   * Forty percent.
   */
  static readonly FORTY_PERCENT: string = '40%';
  /**
   * Thirty percent.
   */
  static readonly THIRTY_PERCENT: string = '30%';
  /**
   * Twenty percent.
   */
  static readonly TWENTY_PERCENT: string = '20%';
  /**
   * Ten percent.
   */
  static readonly TEN_PERCENT: string = '10%';

  /**
   * Background image size.
   */
  static readonly BACKGROUND_IMAGE_SIZE: string = '38.7%';

  /**
   * Center circle image width.
   */
  // static readonly CENTER_IMAGE_WIDTH: string = '19.3%';
  static readonly CENTER_IMAGE_WIDTH: string = '70vp';

  /**
   * Center circle image height.
   */
  // static readonly CENTER_IMAGE_HEIGHT: string = '10.6%';
  static readonly CENTER_IMAGE_HEIGHT: string = '80vp';

  /**
   * Arc text size.
   */
  static readonly ARC_TEXT_SIZE: number = fp2px(12);

  /**
   * Input border radius.
   */
  static readonly INPUT_BORDER_RADIUS: string = '10vp';
  static readonly INPUT_ROW_HEIGHT: string = '30vp';
}