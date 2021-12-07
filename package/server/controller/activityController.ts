import { Request, Response } from 'express';
import { ActivityService } from '../service/activityService';
import { sendSuccessResponse, sendErrorResponse } from '../util/response';
import { MoreThan } from 'typeorm';

export class ActivityController {
  private activityService = new ActivityService();

  findAvailableActivity = async (req: Request, res: Response) => {
    try {
      const availableActivityList = await this.activityService.findAvailableActivity();
      return sendSuccessResponse(res, availableActivityList);
    } catch (e) {
      return sendErrorResponse(res, e.message);
    }
  };
}
