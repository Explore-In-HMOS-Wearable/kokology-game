@Component
export struct HomePage {
  private menuItems: Resource[] = [
    $r('sys.symbol.sun'),
    $r('sys.symbol.face'),
    $r('sys.symbol.heart'),
    $r('sys.symbol.leaf'),
    $r('sys.symbol.star'),
    $r('sys.symbol.eye')
  ];
  private selectedIndex: number = -1;
  private rotationAngle: number = 0;
  private expandProgressList: number[] = this.menuItems.map(() => 1);
  @Consume('pageStack') pageStack: NavPathStack;

  calculatePosition(index: number): Position {
    const angleStep = 2 * Math.PI / this.menuItems.length;
    const baseAngle = angleStep * index - Math.PI / 2;
    const rotatedAngle = baseAngle + (this.rotationAngle * Math.PI / 180);
    const maxRadius = 48;
    const radius = maxRadius * this.expandProgressList[index];

    const x = Math.cos(rotatedAngle) * radius;
    const y = Math.sin(rotatedAngle) * radius;

    return { x: x, y: y };
  }

  build() {
    NavDestination() {
      Column() {
        Text('Kokology Game')
          .fontColor('#FFE082')
          .fontSize(16)
          .fontWeight(FontWeight.Bolder)
          .margin({ top: 24 })

        Text('Dive into your personality. 6 categories, 5 questions each. Choose one below.')
          .fontColor('#90CAF9')
          .fontSize(10)
          .margin({ top: 10 })
          .width('80%')
          .textAlign(TextAlign.Center)

        Stack() {
          SymbolGlyph(this.menuItems[0])
            .width(36)
            .height(36)
            .fontWeight(FontWeight.Bold)
            .borderRadius(50)
            .fontColor(['#000000'])
            .backgroundColor('#FFCC00')
            .shadow({ radius: 6 })
            .position(this.calculatePosition(0))
            .onClick(() => {
              this.pageStack.pushPathByName('GamePage', 0)
            })

          SymbolGlyph(this.menuItems[1])
            .width(36)
            .height(36)
            .fontWeight(FontWeight.Bold)
            .borderRadius(50)
            .fontColor(['#000000'])
            .backgroundColor('#FF4DD2')
            .shadow({ radius: 6 })
            .position(this.calculatePosition(1))
            .onClick(() => {
              this.pageStack.pushPathByName('GamePage', 1)
            })

          SymbolGlyph(this.menuItems[2])
            .width(36)
            .height(36)
            .fontWeight(FontWeight.Bold)
            .fontColor(['#000000'])
            .borderRadius(50)
            .backgroundColor('#FF5757')
            .shadow({ radius: 6 })
            .position(this.calculatePosition(2))
            .onClick(() => {
              this.pageStack.pushPathByName('GamePage', 2)
            })

          SymbolGlyph(this.menuItems[3])
            .width(36)
            .height(36)
            .fontWeight(FontWeight.Bold)
            .borderRadius(50)
            .fontColor(['#000000'])
            .backgroundColor('#00C853')
            .shadow({ radius: 6 })
            .position(this.calculatePosition(3))
            .onClick(() => {
              this.pageStack.pushPathByName('GamePage', 3)
            })

          SymbolGlyph(this.menuItems[4])
            .width(36)
            .height(36)
            .fontWeight(FontWeight.Bold)
            .borderRadius(50)
            .fontColor(['#000000'])
            .backgroundColor('#2979FF')
            .shadow({ radius: 6 })
            .position(this.calculatePosition(4))
            .onClick(() => {
              this.pageStack.pushPathByName('GamePage', 4)
            })

          SymbolGlyph(this.menuItems[5])
            .width(36)
            .height(36)
            .fontWeight(FontWeight.Bold)
            .borderRadius(50)
            .fontColor(['#000000'])
            .backgroundColor('#B39DDB')
            .shadow({ radius: 6 })
            .position(this.calculatePosition(5))
            .onClick(() => {
              this.pageStack.pushPathByName('GamePage', 5)
            })
        }
        .alignContent(Alignment.Center)
        .height('65%')
        .width('65%')
      }
      .backgroundColor('#0D0D0D')
      .height('100%')
      .width('100%')
    }
    .onReady((ctx: NavDestinationContext) => {
      this.pageStack = ctx.pathStack;
    })
    .hideBackButton(true)
  }
}