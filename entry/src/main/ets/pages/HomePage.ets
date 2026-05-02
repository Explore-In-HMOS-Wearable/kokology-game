import { categoryNames } from '../util/Categories';
import { HapticFeedback } from '../util/HapticFeedback';

interface MenuData {
  icon: Resource;
  color: Resource;
  name: string | Resource;
  id: number;
}

@Component
export struct HomePage {
  private menuListData: MenuData[] = [
    {
      icon: $r('sys.symbol.sun'),
      color: $r('app.color.category_1'),
      name: categoryNames[0],
      id: 0
    },
    {
      icon: $r('sys.symbol.face'),
      color: $r('app.color.category_2'),
      name: categoryNames[1],
      id: 1
    },
    {
      icon: $r('sys.symbol.flower'),
      color: $r('app.color.category_3'),
      name: categoryNames[2],
      id: 2
    },
    {
      icon: $r('sys.symbol.a_lightbulb'),
      color: $r('app.color.category_4'),
      name: categoryNames[3],
      id: 3
    },
    {
      icon: $r('sys.symbol.star'),
      color: $r('app.color.category_5'),
      name: categoryNames[4],
      id: 4
    },
    {
      icon: $r('sys.symbol.eye'),
      color: $r('app.color.category_6'),
      name: categoryNames[5],
      id: 5
    }
  ];
  @Consume('pageStack') pageStack: NavPathStack;
  private scroller: Scroller = new Scroller();

  build() {
    NavDestination() {
      Column() {
        Text($r('app.string.app_name'))
          .fontColor($r('app.color.primary_text'))
          .fontSize($r('app.float.title_font_size'))
          .fontWeight(FontWeight.Bolder)
          .margin({ top: 20 })

        List({ space: 12, scroller: this.scroller }) {
          ListItem() {
            Column() {
              Text($r('app.string.home_description'))
                .fontColor($r('app.color.secondary_text'))
                .fontSize($r('app.float.small_font_size'))
                .textAlign(TextAlign.Center)
                .width('100%')
                .padding({ left: 20, right: 20, top: 2 })

              Button($r('app.string.view_history'))
                .height(30)
                .fontSize(10)
                .backgroundColor($r('app.color.btn_background_dark'))
                .margin({ top: 10 })
                .onClick(() => {
                  HapticFeedback.playClick();
                  this.pageStack.pushPathByName('HistoryPage', null);
                })
            }
          }

          ForEach(this.menuListData, (item: MenuData) => {
            ListItem() {
              Row() {
                SymbolGlyph(item.icon)
                  .fontSize(20)
                  .fontColor([$r('app.color.symbol_color')])

                Text(item.name)
                  .fontColor($r('app.color.main_text_black'))
                  .fontSize($r('app.float.button_font_size'))
                  .fontWeight(FontWeight.Medium)
                  .margin({ left: 2 })
              }
              .width('50%')
              .height($r('app.float.button_height'))
              .backgroundColor(item.color)
              .borderRadius(22)
              .justifyContent(FlexAlign.Center)
              .onClick(() => {
                HapticFeedback.playClick();
                this.pageStack.pushPathByName('GamePage', item.id)
              })
            }
            .width('100%')
          }, (item: MenuData) => item.id.toString())

          ListItem() {
            Column().height(100).width('100%')
          }
          .selectable(false)
        }
        .width('100%')
        .layoutWeight(1)
        .edgeEffect(EdgeEffect.Spring)
        .focusable(true)
        .defaultFocus(true)
        .onDigitalCrown((event: CrownEvent) => {
          this.scroller.scrollBy(0, event.degree * 2.0);
        })
      }
      .backgroundColor($r('app.color.background_black'))
      .height('100%')
      .width('100%')
    }
    .onReady((ctx: NavDestinationContext) => {
      this.pageStack = ctx.pathStack;
    })
    .hideBackButton(true)
  }
}