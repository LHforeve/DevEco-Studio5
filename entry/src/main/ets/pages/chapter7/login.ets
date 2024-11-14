import { LoadingDialog, promptAction, router } from '@kit.ArkUI';
import {CycleAvatar} from './component/CycleAvatar'
import { WanAppLoginRespData,Data } from './model/WanappData';
import {requestGet} from './HttpUtils'
import { http } from '@kit.NetworkKit';
import { requestPostWithFormData } from './HttpUtils'
import { parseJson } from './VoUtils';
import { BusinessError } from '@kit.BasicServicesKit';


@Entry
@Component
struct Page {
  @State message: string = 'Hello World';
  @State userName:string = ''
  @State password:string = ''
  @State result: string = ''
  @State loginResult: WanAppLoginRespData = new WanAppLoginRespData()

  build() {
    Column({ space: 20 }) {
      CycleAvatar()
      Text(this.getLoginTipsStr()).fontColor(Color.Orange)
      Image($r('app.media.WeixinApp_pic'))
        .width(80)
        .height(80)
        .borderRadius(40)
        .alt($r('app.media.WeixinApp_pic')) //占位图
      TextInput({ placeholder: $r('app.string.Str_tips_input_username') })
      TextInput({ placeholder: $r('app.string.Str_tips_input_password') })

      Button('登录')
        // .enabled(this.loginState.sub.isEnable)
        .width('100%').onClick(()=> {
        if (this.userName === '' || this.password === '') {
          console.log("触发if")
          promptAction.showToast({ message: '用户名或者密码不能为空' });
          return;
        }

        console.log("加载窗口")
        //显示加载窗口
        this.dialogControllerProgress.open()
        //执行登录请求
        this.doLogin(this.userName, this.password)
    })


      Row() {
        Checkbox()
        Text('我已认真阅读并同意用户协议、隐私协议')
      }

      Row({ space: 20 }) {
        Text("注册")
        Text("忘记密码")
      }
    }.width('100%').height('100%')
    .justifyContent(FlexAlign.Center)
  }

  doLogin(uname: string, pwd: string) {
    try {
      let reqData: Array<http.MultiFormData> = [
        {
          name: "username", //数据名
          contentType: 'text/plain', //数据类型
          data: uname, //数据内容
        }, {
        name: "password", //数据名
        contentType: 'text/plain', //数据类型
        data: pwd, //数据类型
      }
      ]
      requestPostWithFormData('https://www.wanandroid.com/user/login', reqData)
        .then((response) => {
          //数据装填
          this.result = response.toString() || ''
          this.loginResult = parseJson<WanAppLoginRespData>(this.result) || new WanAppLoginRespData()
          //如果存在异常，提示
          if (this.loginResult.data == null) {
            promptAction.showToast({ message: `失败:${(this.loginResult.errorMsg)}` })
          }
          this.dialogControllerProgress.close() //关闭弹幕
        }).catch((err: BusinessError) => {
        console.error(this.result);
        this.dialogControllerProgress.close() //关闭弹幕
      });
    } catch (e) {
      promptAction.showToast({ message: e.data })
      console.error(e.data)
    }
  }

  getLoginTipsStr():string{
      if (this.loginResult.data == null || this.loginResult.data.id === 0) {
        return ''
      } else {
        return `账号ID:${this.loginResult.data.id}登录成功!欢迎${this.loginResult.data.id}回家!`
      }
    }

  dialogControllerProgress: CustomDialogController = new CustomDialogController({
      builder: LoadingDialog({
        content: '登录中...'
      })
    })

}
