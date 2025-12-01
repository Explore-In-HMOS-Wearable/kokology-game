import ResultModel from '../model/ResultModel';
import {
  kokologyResultCategory1,
  kokologyResultCategory2,
  kokologyResultCategory3,
  kokologyResultCategory4,
  kokologyResultCategory5,
  kokologyResultCategory6
} from '../util/ResultData';


@Observed
export class ResultViewModel {
  private _kokologyResultCategory1: ResultModel = kokologyResultCategory1;
  private _kokologyResultCategory2: ResultModel = kokologyResultCategory2;
  private _kokologyResultCategory3: ResultModel = kokologyResultCategory3;
  private _kokologyResultCategory4: ResultModel = kokologyResultCategory4;
  private _kokologyResultCategory5: ResultModel = kokologyResultCategory5;
  private _kokologyResultCategory6: ResultModel = kokologyResultCategory6;

  getkokologyResultCategory1(): ResultModel {
    return this._kokologyResultCategory1;
  }

  getkokologyResultCategory2(): ResultModel {
    return this._kokologyResultCategory2;
  }

  getkokologyResultCategory3(): ResultModel {
    return this._kokologyResultCategory3;
  }

  getkokologyResultCategory4(): ResultModel {
    return this._kokologyResultCategory4;
  }

  getkokologyResultCategory5(): ResultModel {
    return this._kokologyResultCategory5;
  }

  getkokologyResultCategory6(): ResultModel {
    return this._kokologyResultCategory6;
  }
}