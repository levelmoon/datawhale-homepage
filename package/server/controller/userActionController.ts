import { Request, Response } from 'express';
import { UserActionService } from '../service/actionService';
import { sendSuccessResponse, sendErrorResponse } from '../util/response';

export class UserActionController {
  private userActionService = new UserActionService();

  addUserAction = async (req: Request, res: Response) => {
    try {
      // 存取用户行为
      const { sessionId, logList } = req.body;
      await this.userActionService.addUserAction(sessionId, logList);
      sendSuccessResponse(res, 'save user action successful');
    } catch (e) {
      sendErrorResponse(res, e.message);
    }
  };
}
