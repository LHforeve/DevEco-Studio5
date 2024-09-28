@Component
@Preview
export struct CycleAvatar {

  src?:Resource;
  placeholderSrc?:Resource

  build(){
      Image(this.src || '')
        .width(80)
        .height(80)
        .borderRadius(40)
        .alt(this.placeholderSrc || $r('app.media.img_avatar_default'));
  }
}