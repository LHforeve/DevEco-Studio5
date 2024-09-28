import {CycleAvatar} from './component/CycleAvatar'

@Entry
@Component
struct Page2 {
  @State message: string = 'Hello World'

  build()  {
    Column({space:20}) {
      CycleAvatar(
        {
          src:$r('app.media.img_demo02')

        }
      )
      Image($r('app.media.app_icon_real'))
        .width(80)
        .height(80)
        .borderRadius(40)
        .alt($r('app.media.img_avatar_default'))
        .margin(30)
      TextInput({placeholder:$r('app.string.str_tips_input_username')}).width('90%')
      TextInput({placeholder:$r('app.string.str_tips_input_password')}).width('90%')
      Button('登入').width('80%')
      Row() {
        Checkbox()
        Text('我已认真阅读并同意用户协议，隐私协议').fontSize(14)

      }
      Row({space:20}){
        Text('注册')
        Text('忘记密码')
      }
      Row(){
        Row().size({width:'100%', height:'100%'}).backgroundColor(Color.White)
      }
      .width(80)
      .height(80)
      .padding({top:5,left:10,bottom:15,right:20})
      .margin(20)
      .backgroundColor(Color.White)
    }
    .width('100%').height('100%')
    .justifyContent(FlexAlign.Center)
  }
}