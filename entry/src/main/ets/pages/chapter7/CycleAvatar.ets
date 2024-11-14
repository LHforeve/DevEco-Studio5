@Component
@Preview
export struct CycleAvatar{
  build() {
    Image('')
      .width(80)
      .height(80)
      .borderRadius(40)
      .alt($r('app.media.Avatar_pic'))
  }
}