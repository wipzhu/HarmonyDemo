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
   * Sixty percent.
   */
  static readonly SIXTY_PERCENT: string = '60%';

  /**
   * Forty percent.
   */
  static readonly FORTY_PERCENT: string = '40%';

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
  static readonly ARC_TEXT_SIZE: number = fp2px(14);

  /**
   * Input border radius.
   */
  static readonly INPUT_BORDER_RADIUS: string = '10vp';
}