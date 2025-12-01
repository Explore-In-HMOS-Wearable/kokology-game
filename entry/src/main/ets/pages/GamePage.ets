import GameModel from '../model/GameModel';
import { ResultParam } from '../model/ResultParam';
import { categories } from '../util/Categories';
import { GameViewModel } from '../viewmodel/GameViewModel';

@Component
export struct GamePage {
  @Consume('pageStack') pageStack: NavPathStack;
  private viewModel: GameViewModel = new GameViewModel();
  @State currentQuestionList: Array<GameModel> = [];
  @State currentIndex: number = 0;
  @State selectedAnswer: string = '';
  @State selectedAnswers: string[] = [];
  private categoryIdTitle: number = 0;

  build() {
    NavDestination() {
      Column() {
        Text('Kokology Game')
          .fontColor('#FFE082')
          .fontSize(16)
          .fontWeight(FontWeight.Bolder)
          .margin({ top: 4 })

        Text(categories[this.categoryIdTitle])
          .fontColor('#90CAF9')
          .fontSize(12)
          .margin({ top: 10 })

        if (this.currentQuestionList.length > 0) {
          Text(`Q${this.currentIndex + 1}. ${this.currentQuestionList[this.currentIndex].question}`)
            .fontSize(9)
            .fontWeight(FontWeight.Medium)
            .fontColor('#EEEEEE')
            .margin({ top: 16, bottom: 8 })
            .width('85%')
            .textAlign(TextAlign.Center)

          Button(this.currentQuestionList[this.currentIndex].optionA)
            .width('65%')
            .height(30)
            .fontSize(9)
            .backgroundColor('#2979FF')
            .fontColor(Color.White)
            .shadow({ radius: 6 })
            .onClick(() => this.handleAnswer('A'))

          Button(this.currentQuestionList[this.currentIndex].optionB)
            .width('65%')
            .height(30)
            .fontSize(9)
            .backgroundColor('#00C853')
            .fontColor(Color.White)
            .shadow({ radius: 6 })
            .margin({ top: 10 })
            .onClick(() => this.handleAnswer('B'))
        } else {
          Text('Loading questions...')
            .fontSize(12)
            .fontColor(Color.Gray)
        }
      }
      .alignItems(HorizontalAlign.Center)
      .justifyContent(FlexAlign.Center)
      .width('100%')
      .height('100%')
      .backgroundColor('#0D0D0D')
    }
    .onReady((ctx: NavDestinationContext) => {
      this.pageStack = ctx.pathStack;
      const categoryId = ctx.pathInfo.param as number;
      this.categoryIdTitle = categoryId;

      if (categoryId == 0) {
        this.currentQuestionList =
          this.viewModel.getkokologyQuestionsCategory1();
      } else if (categoryId == 1) {
        this.currentQuestionList =
          this.viewModel.getkokologyQuestionsCategory2();
      } else if (categoryId == 2) {
        this.currentQuestionList =
          this.viewModel.getkokologyQuestionsCategory3();
      } else if (categoryId == 3) {
        this.currentQuestionList =
          this.viewModel.getkokologyQuestionsCategory4();
      } else if (categoryId == 4) {
        this.currentQuestionList =
          this.viewModel.getkokologyQuestionsCategory5();
      } else if (categoryId == 5) {
        this.currentQuestionList =
          this.viewModel.getkokologyQuestionsCategory6();
      }
    })
    .hideBackButton(true)
  }

  handleAnswer(option: string) {
    this.selectedAnswers.push(option);

    if (this.currentIndex < this.currentQuestionList.length - 1) {
      this.currentIndex++;
    } else {
      const paramObj: ResultParam = {
        answers: this.selectedAnswers,
        category: this.categoryIdTitle
      };
      this.pageStack.pushPathByName('ResultPage', paramObj);
    }
  }
}
