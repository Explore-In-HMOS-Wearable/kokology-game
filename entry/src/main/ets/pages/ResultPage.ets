import ResultModel from '../model/ResultModel';
import { ResultParam } from '../model/ResultParam';
import { categories } from '../util/Categories';
import { ResultViewModel } from '../viewmodel/ResultViewModel';

@Component
export struct ResultPage {
  @Consume('pageStack') pageStack: NavPathStack;
  private viewModel: ResultViewModel = new ResultViewModel();
  @State answers: string[] = [];
  @State category: number = 0;
  @State finalResult: string = '';

  build() {
    NavDestination() {
      Column() {
        Text('Your Kokology Result')
          .fontColor('#FFE082')
          .fontSize(16)
          .fontWeight(FontWeight.Bolder)
          .margin({ top: 6 })

        Text(categories[this.category])
          .fontColor('#90CAF9')
          .fontSize(12)
          .margin({ top: 10 })

        Text(this.finalResult)
          .fontColor('#EEEEEE')
          .fontSize(9)
          .margin({ top: 12, bottom: 10 })
          .width('80%')
          .textAlign(TextAlign.Center)

        Button('Go to Home Page')
          .onClick(() => {
            this.pageStack.pushPathByName('HomePage', null);
          })
          .width('60%')
          .height(30)
          .fontSize(9)
          .backgroundColor('#00C853')
          .fontColor(Color.White)
          .shadow({ radius: 6 })
      }
      .alignItems(HorizontalAlign.Center)
      .justifyContent(FlexAlign.Center)
      .width('100%')
      .height('100%')
      .backgroundColor('#0D0D0D')
    }
    .onReady((ctx: NavDestinationContext) => {
      this.pageStack = ctx.pathStack;
      const data = ctx.pathInfo.param as ResultParam;
      this.answers = data.answers;
      this.category = data.category;

      let countA = this.answers.filter(a => a === 'A').length;
      let countB = this.answers.filter(a => a === 'B').length;

      let resultModel: ResultModel;
      switch (this.category) {
        case 0:
          resultModel = this.viewModel.getkokologyResultCategory1();
          break;
        case 1:
          resultModel = this.viewModel.getkokologyResultCategory2();
          break;
        case 2:
          resultModel = this.viewModel.getkokologyResultCategory3();
          break;
        case 3:
          resultModel = this.viewModel.getkokologyResultCategory4();
          break;
        case 4:
          resultModel = this.viewModel.getkokologyResultCategory5();
          break;
        case 5:
          resultModel = this.viewModel.getkokologyResultCategory6();
          break;
        default:
          resultModel = new ResultModel();
      }

      if (countA > countB) {
        this.finalResult = resultModel.resultA;
      } else {
        this.finalResult = resultModel.resultB;
      }
    })
    .hideBackButton(true)
  }
}
