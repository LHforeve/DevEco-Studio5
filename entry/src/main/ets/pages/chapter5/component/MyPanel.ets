@Preview
@Component
export struct MyPanel{
  label:string = 'default'
  bgColor:Color = Color.Blue
  panelSize:number = 100
  build() {
    Row(){
      Text(this.label).fontColor(Color.White)
    }.justifyContent(FlexAlign.Center).backgroundColor(this.bgColor)
    .width(this.panelSize)
    .height(this.panelSize)
  }
}