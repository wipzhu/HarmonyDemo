import notification from '@ohos.notificationManager';

@Entry
@Component
struct NotificationDemo {
  publishNotification() {
    let notificationRequest: notification.NotificationRequest = { // 描述通知的请求
      id: 1, // 通知ID
      slotType: notification.SlotType.SERVICE_INFORMATION,
      content: { // 通知内容
        contentType: notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT, // 普通文本类型通知
        normal: { // 基本类型通知内容
          title: '通知内容标题',
          text: '通知内容详情',
          additionalText: '通知附加内容', // 通知附加内容，是对通知内容的补充。
        }
      }
    }
    notification.publish(notificationRequest).then(() => { // 发布通知
      console.info('publish success');
    }).catch((err) => {
      console.error(`publish failed, dcode:${err.code}, message:${err.message}`);
    });
  }

  build() {
    Column() {
      Button('发送通知')
        .onClick(() => {
          this.publishNotification()
        })
    }
    .width('100%')
  }
}