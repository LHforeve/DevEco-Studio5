import toast from '@ohos.promptAction'

enum GameStatus{
  Normal,
  Running,
  Paused,
  Finished
}

@Entry
@Component

struct Page1 {

  @State message: string = 'Hello World';
  //按钮文本
  @State gameBtnLabel: string = "开始";
  //按钮初始颜色
  @State gameBtnColor:Color = Color.Green
  //当前游戏状态
  mGameStatus = GameStatus.Normal;
  //计时控制器
  mTextTimerCountDownControl:TextTimerController = new TextTimerController()
  @State board:Array<Array<number>> = [
    [3,11,2,6],
    [7,1,15,5],
    [4,8,9,13],
    [12,10,14,0]
  ]
  blankRowColIndex: [number, number] = [3, 3]; // 初始化空白格位置
  build() {

    Column(){//垂直线性布局，对应行
      Row(){
        Text('计时器：').fontSize(20)
        TextTimer({
          isCountDown:true,
          count:300000,//单位为毫秒
          controller:this.mTextTimerCountDownControl
        }).fontSize(20)
          .fontColor(Color.Blue)
        Button('start').onClick(() =>{
          this.mTextTimerCountDownControl.start()
        }).width(80).margin(10)
      }
      ForEach(this.board,(row: Array<number>, rowIndex: number) => {//二维数组嵌套循环
        Row(){//水平线性布局，对应列
          ForEach(row,(item: number, colIndex) => {//循环
            Button(this.getButtonDisplayStrByValue(item), {
              type :ButtonType.Normal,
            })//按钮
              .width('70')
              .height('70')
              .backgroundColor(this.getBackgroundColorByValue(item))
              .border({width:1, color:Color.White})//设置边框
              .onClick(() => this.handleMove(rowIndex, colIndex))
          })
        }
      })
      Button(this.gameBtnLabel).onClick(() => {
        this.doAction();
      }).width(120).backgroundColor(this.gameBtnColor)
        .margin(20)
      Divider().padding(20)

    }


  }

  getBackgroundColorByValue(value: number): string {
    return value === 0? '#ffb627dd' : '#ff2638ec';
  }

  getButtonDisplayStrByValue(value:number) :string{
    return value === 0? '' : value.toString();
  }

  handleMove(targetRow: number, targetCol: number){
    if (this.isValidMove(targetRow, targetCol, this.blankRowColIndex[0], this.blankRowColIndex[1])) {
      this.move(this.blankRowColIndex[0], this.blankRowColIndex[1], targetRow, targetCol);
      this.blankRowColIndex = [targetRow, targetCol]
    }
  }

  isValidMove(row:number,
    col:number,
    blankRow:number,
    blankCol:number
  ):boolean{
    if (this.mGameStatus != GameStatus.Running) {
      toast.showToast({message:'请开始或继续游戏才能操纵棋子'})
      return false
    }
    return Math.abs(row - blankRow) +Math.abs(col - blankCol) === 1;
  }

  move(blankRow: number, blankCol:number,targetRow:number,targetCol:number){
    let temp = this.board[blankRow][blankCol];
    this.board[blankRow][blankCol] = this.board[targetRow][targetCol];
    this.board[targetRow][targetCol] = temp;

    this.updateBoard();
  }

  updateBoard(): void{
    this.board = [...this.board];
  }



  //游戏按钮执行逻辑
  doAction(){
    if (this.mGameStatus == GameStatus.Normal
      || this.mGameStatus == GameStatus.Paused){
      this.mTextTimerCountDownControl.start()
      this.mGameStatus = GameStatus.Running
      this.gameBtnLabel = "暂停";
      this.gameBtnColor = Color.Red
    }else if (this.mGameStatus == GameStatus.Running){
      this.mTextTimerCountDownControl.pause()
      this.mGameStatus = GameStatus.Paused
      this.gameBtnLabel = "继续"
      this.gameBtnColor = Color.Blue
    }
  }



}