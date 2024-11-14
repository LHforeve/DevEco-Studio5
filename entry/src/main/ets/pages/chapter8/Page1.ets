import { router,Prompt, prompt, promptAction } from '@kit.ArkUI'

import { common, OpenLinkOptions } from '@kit.AbilityKit'
import { BizEvent } from './Constants'
import {bundleManager} from '@kit.AbilityKit'
import { BusinessError} from '@kit.BasicServicesKit'
import { photoAccessHelper } from '@kit.MediaLibraryKit'
import { HeaderBar } from '../chapter5/component/HeaderBar'


@Entry
@Component
struct test1 {
  @State title: string = '练习'
  @State isLocating: boolean = false
  schemeUrl: string = "music://com.class5.musicapp/index";
  @State oneImgUri: string = "";
  //获取上下文
  private context = getContext(this) as common.UIAbilityContext

  build() {
    Column() {
      HeaderBar({ title: this.title })
      Column({ space: 10 }) {
        Text("第8章 Ability")
          .fontSize(25)
          .fontWeight(FontWeight.Bold)
        Button("使用ApplicationContext彻底退出应用").enabled(true).width('100%').onClick(() => {
          router.pushUrl({
            url: 'pages/chapter7/HttpGetReqPage'
          })
        })
        Button("UIAbility.terminateSelf关闭应用组件").enabled(true).width('100%').onClick(() => {
          router.pushUrl({
            url: 'pages/chapter7/HttpGetReqPage1'
          })
        })
        Button("启动另一个Ability").enabled(true).width('100%').onClick(() => {
          router.pushUrl({
            url: 'pages/chapter7/login'
          })
        })
        Button(this.isLocating ? '结束定位' : '启用定位').width('100%').onClick(() => {
          if (this.isLocating) {
            this.isLocating = false
          } else {
            this.isLocating = true
          }
          //发送事件
          this.context.eventHub.emit(BizEvent.EVENT_LOCATION_START, this.isLocating);
        })
        Column({ space: 10 }) {
          TextInput({ text: this.schemeUrl }).onChange((value => {
            this.schemeUrl = value
          }))
          Button("使用应用链接启动应用").width('100%').onClick(() => {
            this.startAppByDeepLink(this.schemeUrl)
          })
        }.border({ width: 1, color: Color.Blue }).padding(10)
      }.margin(30)

      Column() {
        Image(this.oneImgUri).width('50%')
        Button("拉起系统应用-图库").width('80%')
          .onClick(() => {
            this.startPhotoPicker()
          })
      }.border({ width: 1 }).padding(30)
    }
  }

  startAppByDeepLink(link: string) {
    let context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext;
    try {
      if (!bundleManager.canOpenLink(link)) {
        promptAction.showToast({ message: `链接：${link}无法打开,请确认是否正确` })
        return;
      }
    } catch (e) {
      //如果scheme配置错误 抛出异常
      console.error(`startAppByDeepLink fail,reason:${JSON.stringify(e)}`)
      promptAction.showToast({ message: `链接,${link}无法打开,原因,${e.message}` })
      return;
    }
    let openLinkOptions: OpenLinkOptions = {
      appLinkingOnly: false
    };

    try {
      context.openLink(link, openLinkOptions)//启动应用
        .then(() => {
          console.log('open link success');
        }).catch((err: BusinessError) => {
        console.log(`open link failed.Code is ${err.code},message is ${err.message}`);
      });
    } catch (paramError) {
      console.log(`Failed to start link.Code is ${paramError.code},message is ${paramError.message}`);
    }
  }

  startPhotoPicker() {
    const photoSelectOptions = new photoAccessHelper.PhotoSelectOptions();
    photoSelectOptions.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_TYPE;
    photoSelectOptions.maxSelectNumber = 1;
    let uris: Array<string> = [];
    const photoViewPicker = new photoAccessHelper.PhotoViewPicker();
    photoViewPicker.select(photoSelectOptions)
      .then((photoSelectResult: photoAccessHelper.PhotoSelectResult) => {
        uris = photoSelectResult.photoUris;
        console.info('photoViewPicker.select to file succeed and uris are:' + uris);
        if (uris.length > 0) {
          this.oneImgUri = uris[0]
        }
      }).catch((err: BusinessError) => {
      console.error(`Invoke photoViewPicker.select failed,
      code is ${err.code},message is ${err.message}`);
    })
  }
}