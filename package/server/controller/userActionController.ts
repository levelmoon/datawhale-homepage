import { Request, Response } from 'express';
import { UserActionService } from '../service/actionService';
import { sendSuccessResponse, sendErrorResponse } from '../util/response';

export class UserActionController {
  private userActionService = new UserActionService();

  addUserAction = async (req: Request, res: Response) => {
    try {
      // 存取用户行为
      console.log(req);
      const output = await this.userActionService.addUserAction(req.body);
      sendSuccessResponse(res, output);
    } catch (e) {
      sendErrorResponse(res, e.message);
    }
  };
}
