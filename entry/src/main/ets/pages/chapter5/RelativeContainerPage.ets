import {router , Prompt} from '@kit.ArkUI';
import { MyPanel } from './component/MyPanel';

@Entry
@Component
struct RelativeContainerPage {
  @State title: string = '相对布局'

  build() {
    Column() {
      this.buildTitle();

      this.buildDemo01()
    }.width('100')
    .justifyContent(FlexAlign.Center)
  }
  @Builder
  buildTitle() {
    Text(this.title)
    Divider().padding(10)
  }


  @Builder
  buildDemo01(){
    RelativeContainer(){
      /**
      .guideLine([
        {id:'gline_h_01',direction:Axis.Horizontal,position:{start:200}},
        {id:'gline_v_01',direction:Axis.Vertical,position:{start:200}},
      ])
       **/
      MyPanel({label:'左上'})
        .alignRules({
          start:{
            anchor:'__container__',
            align:HorizontalAlign.Start
          },
          top:{
            anchor:'__container__',
            align:VerticalAlign.Top
          }
        }).id('panel01')

      MyPanel({label:'右下',bgColor:Color.Orange})
        .alignRules({
          end:{
            anchor:'__container__',
            align:HorizontalAlign.End
          },
          bottom:{
            anchor:'__container__',
            align:VerticalAlign.Bottom
          }
        }).id('panel02')

      MyPanel({label:'左上_下',bgColor:Color.Green})
        .alignRules({
          start:{
            anchor:'panel01',
            align:HorizontalAlign.Start
          },
          bottom:{
            anchor:'panel01',
            align:VerticalAlign.Bottom
          }
        }).id('panel03')

      MyPanel({label:'居中',panelSize:50,bgColor:Color.Red})
        .alignRules({
          end:{
            anchor:'__container__',
            align:HorizontalAlign.Center
          },
          bottom:{
            anchor:'__container__',
            align:VerticalAlign.Center
          }
        }).id('panel05')

      MyPanel({label:'覆盖',panelSize:50,bgColor:Color.Blue})
        .alignRules({
          end:{
            anchor:'panel02',
            align:HorizontalAlign.Center
          },
          bottom:{
            anchor:'panel02',
            align:VerticalAlign.Center
          }
        }).id('panel06')

      MyPanel({label:'水平线',panelSize:50,bgColor:Color.Pink})
        .alignRules({
          top:{
            anchor:'gline_h_01',
            align:VerticalAlign.Top
          },
          middle:{
            anchor:'__container__',
            align:HorizontalAlign.Center
          }
        }).id('panel07')

      MyPanel({label:'垂直线',panelSize:50,bgColor:Color.Pink})

        .alignRules({
          top:{
            anchor:'__container__',
            align:VerticalAlign.Top
          },
          middle:{
            anchor:'gline_v_01',
            align:HorizontalAlign.Start
          }
        }).id('panel08')


    }.width('300').height('300').backgroundColor('#ffb8f7ff')
  }




  @Builder
  buildRouterBtn() {
    Button("正常访问").width('100%').onClick(()=>{
      router.pushUrl({
        url:'pages/chapter5/TabsPage'
      })
    })
    Button("异常访问").width('100%').onClick(()=>{
      router.pushUrl({
        url: 'errorUrl',
        params: '页面路由 (@ohos.router)'
      },(err)=>{
        if (err) {
          let msg:string = 'code:${err.code} msg:${err.message}'
          Prompt.showDialog({title:'router,pushUrl异常',message:msg})
        }
      })
    })
    Button("返回").width('100%').onClick(()=>{
      router.back()
    })

  }
}