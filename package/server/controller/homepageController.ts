import { Request, Response } from 'express';
import { ActivityService } from '../service/activityService';
import { BannerService } from '../service/bannerService';
import { MoreThan } from 'typeorm';
import { sendSuccessResponse, sendErrorResponse } from '../util/response';
import { LearnService } from '../service/learnService';

export class HomepageController {
  private activityService = new ActivityService();
  private bannerService = new BannerService();
  private learnService = new LearnService();

  helloWorld = (req: Request, res: Response) => {
    try {
      res.send('hello world!!!');
    } catch (e) {
      res.send(e.message);
    }
  };

  getHomepageData = async (req: Request, res: Response) => {
    try {
      const output = { banner: [], activity: [], learn: [] };

      // 获取banner
      const bannerList = await this.bannerService.findFiveAvailableBanner();
      output.banner = bannerList;

      // 获取当前可用的活动列表
      const activityList = await this.activityService.findAvailableActivity();
      output.activity = activityList;

      // 获取首页推荐的学习列表
      const learnList = await this.learnService.findLearn({
        order: { like: 'DESC' },
        take: 5,
        skip: 0
      });
      output.learn = learnList;

      return sendSuccessResponse(res, output);
    } catch (e) {
      res.send(e.message);
    }
  };
}
