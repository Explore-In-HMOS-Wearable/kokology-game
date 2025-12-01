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
  private menuItemColors: Array<string> = [
    '#FFCC00',
    '#FF4DD2',
    '#FF5757',
    '#00C853',
    '#2979FF',
    '#B39DDB'
  ];
  @State selectedIndex: number = -1;
  @State rotationAngle: number = 0;
  @State expandProgressList: number[] = this.menuItems.map(() => 1);
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
          ForEach(this.menuItems, (item: Resource, index: number) => {
            ListItem() {
              SymbolGlyph(item)
                .width(36)
                .height(36)
                .fontWeight(FontWeight.Bold)
                .borderRadius(50)
                .fontColor(['#000000'])
                .backgroundColor(this.menuItemColors[index])
                .shadow({ radius: 6 })
                .position(this.calculatePosition(index))
                .onClick(() => {
                  this.pageStack.pushPathByName('GamePage', index);
                })
            }
          }, (item: Resource) => item.id.toString())
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