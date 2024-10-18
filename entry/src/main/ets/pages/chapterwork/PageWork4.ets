import { router } from '@kit.ArkUI';
@Component
@Entry
struct PageWork4 {
  build() {
    Column(){
      this.buildReLayout()
    }
  }
  @Builder
  buildReLayout() {
    RelativeContainer() {
      Text('Profile')
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
        .margin(3)
        .id('text01')
        .margin({ left: 20 })

      Image($r('app.media.3'))
        .width(80).height(80).borderRadius(40)
        .id('img01')
        .margin({top:50,left:20})

      Text('LH')
        .fontSize(20)
        .fontColor('#121212')
        .id('text02')
        .alignRules({
          start: { anchor: 'img01', align: HorizontalAlign.End },
          bottom: { anchor: 'img01', align: VerticalAlign.Center },
        })
        .margin({ left: 20, bottom: 3 })
        .fontWeight(FontWeight.Bold)

      Text('Edit Profile')
        .fontSize(20)
        .fontColor('#A6A6A6')
        .id('text03')
        .alignRules({
          start: { anchor: 'text02', align: HorizontalAlign.Start },
          top: { anchor: 'img01', align: VerticalAlign.Center },
          end:{anchor:'img_arrow',align:HorizontalAlign.Start}
        })
        .margin({ top: 3 ,right:30})
        .textOverflow({overflow:TextOverflow.Ellipsis})
        .maxLines(2)
        .ellipsisMode(EllipsisMode.END)

      Text('Account')
        .fontSize(25)
        .margin(3)
        .id('text04')
        .alignRules({
          start: { anchor: 'text01', align: HorizontalAlign.Start },
        })
        .margin({ top:150})
        .fontWeight(FontWeight.Bold)

      Text('Emall')
        .fontSize(25)
        .margin(3)
        .id('text05')
        .alignRules({
          start: { anchor: 'text01', align: HorizontalAlign.Start },
        })
        .margin({ top:200})
        .fontWeight(FontWeight.Bold)

      Text('LH@type.com')
        .fontSize(18)
        .margin(3)
        .id('text06')
        .alignRules({
          start: { anchor: 'text01', align: HorizontalAlign.Start },
        })
        .margin({ top:240})
        .fontColor('#A6A6A6')

      Text('Playback')
        .fontSize(25)
        .margin(3)
        .id('text07')
        .alignRules({
          start: { anchor: 'text01', align: HorizontalAlign.Start },
        })
        .margin({ top:280})
        .fontWeight(FontWeight.Bold)

      Text('Office mode')
        .fontSize(25)
        .margin(3)
        .id('text08')
        .alignRules({
          start: { anchor: 'text01', align: HorizontalAlign.Start },
        })
        .margin({ top:330})
        .fontWeight(FontWeight.Bold)

      Text('When you go offline,you only able to play the song you are downloaded')
        .fontSize(15)
        .margin(3)
        .id('text09')
        .alignRules({
          start: { anchor: 'text01', align: HorizontalAlign.Start },
          end:{anchor:'text03',align:HorizontalAlign.End}
        })
        .margin({ top:370})
        .fontColor('#A6A6A6')
        .textOverflow({overflow:TextOverflow.Ellipsis})
        .maxLines(3)
        .ellipsisMode(EllipsisMode.END)


      Text('Automix')
        .fontSize(25)
        .margin(3)
        .id('text10')
        .alignRules({
          start: { anchor: 'text01', align: HorizontalAlign.Start },
        })
        .margin({ top:430})
        .fontWeight(FontWeight.Bold)

      Text('Allow smooth transitions between songs in a playlist')
        .fontSize(15)
        .margin(3)
        .id('text11')
        .alignRules({
          start: { anchor: 'text01', align: HorizontalAlign.Start },
          end:{anchor:'text03',align:HorizontalAlign.End}
        })
        .margin({ top:470})
        .fontColor('#A6A6A6')

      Text('Show unplayable')
        .fontSize(25)
        .margin(3)
        .id('text12')
        .alignRules({
          start: { anchor: 'text01', align: HorizontalAlign.Start },
        })
        .margin({ top:520})
        .fontWeight(FontWeight.Bold)

      Text('Show songs that are unplayable')
        .fontSize(15)
        .margin(3)
        .id('text13')
        .alignRules({
          start: { anchor: 'text01', align: HorizontalAlign.Start },
        })
        .margin({ top:560})
        .fontColor('#A6A6A6')

      Toggle({ type: ToggleType.Switch, isOn: false })
        .alignRules({
          center: { anchor: 'text09', align:VerticalAlign.Top },
        })
        .margin({left:280})
      Toggle({ type: ToggleType.Switch, isOn: true })
        .alignRules({
          center: { anchor: 'text09', align:VerticalAlign.Top },
        })
        .margin({left:280})

      Toggle({ type: ToggleType.Switch, isOn: false })
        .alignRules({
          center: { anchor: 'text11', align:VerticalAlign.Top },
        })
        .margin({left:280})
      Toggle({ type: ToggleType.Switch, isOn: true })
        .alignRules({
          center: { anchor: 'text11', align:VerticalAlign.Top },
        })
        .margin({left:280})

      Toggle({ type: ToggleType.Switch, isOn: false })
        .alignRules({
          center: { anchor: 'text13', align:VerticalAlign.Top },
        })
        .margin({left:280})
      Toggle({ type: ToggleType.Switch, isOn: true })
        .alignRules({
          center: { anchor: 'text13', align:VerticalAlign.Top },
        })
        .margin({left:280})






      Image($r('app.media.a1'))
        .width(50).height(50)
        .id('img08')
        .margin({ top:650,left:40})
        .onClick(()=>{
          router.pushUrl({
            url: 'pages/chapterwork/PageWork'
          })
        })


      Image($r('app.media.a2'))
        .width(50).height(50)
        .id('img09')
        .alignRules({
          top: { anchor: 'img08', align: VerticalAlign.Top},
        })
        .margin({ left:115})
        .onClick(()=>{
          router.pushUrl({
            url: 'pages/chapterwork/PageWork2'
          })
        })


      Image($r('app.media.a3'))
        .width(50).height(50)
        .id('img10')
        .alignRules({
          top: { anchor: 'img08', align: VerticalAlign.Top},
        })
        .margin({ left:195})
        .onClick(()=>{
          router.pushUrl({
            url: 'pages/chapterwork/PageWork3'
          })
        })

      Image($r('app.media.a4'))
        .width(50).height(50)
        .id('img11')
        .alignRules({
          top: { anchor: 'img08', align: VerticalAlign.Top},
        })
        .margin({ left:270})
        .onClick(()=>{
          router.pushUrl({
            url: 'pages/chapterwork/PageWork4'
          })
        })











    }
  }
}