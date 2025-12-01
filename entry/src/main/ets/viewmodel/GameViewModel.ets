import GameModel from '../model/GameModel';
import {
  kokologyQuestionsCategory1,
  kokologyQuestionsCategory2,
  kokologyQuestionsCategory3,
  kokologyQuestionsCategory4,
  kokologyQuestionsCategory5,
  kokologyQuestionsCategory6
} from '../util/GameData';

@Observed
export class GameViewModel {
  private _kokologyQuestionsCategory1: Array<GameModel> = kokologyQuestionsCategory1;
  private _kokologyQuestionsCategory2: Array<GameModel> = kokologyQuestionsCategory2;
  private _kokologyQuestionsCategory3: Array<GameModel> = kokologyQuestionsCategory3;
  private _kokologyQuestionsCategory4: Array<GameModel> = kokologyQuestionsCategory4;
  private _kokologyQuestionsCategory5: Array<GameModel> = kokologyQuestionsCategory5;
  private _kokologyQuestionsCategory6: Array<GameModel> = kokologyQuestionsCategory6;

  getkokologyQuestionsCategory1(): Array<GameModel> {
    return this._kokologyQuestionsCategory1;
  }

  getkokologyQuestionsCategory2(): Array<GameModel> {
    return this._kokologyQuestionsCategory2;
  }

  getkokologyQuestionsCategory3(): Array<GameModel> {
    return this._kokologyQuestionsCategory3;
  }

  getkokologyQuestionsCategory4(): Array<GameModel> {
    return this._kokologyQuestionsCategory4;
  }

  getkokologyQuestionsCategory5(): Array<GameModel> {
    return this._kokologyQuestionsCategory5;
  }

  getkokologyQuestionsCategory6(): Array<GameModel> {
    return this._kokologyQuestionsCategory6;
  }
}