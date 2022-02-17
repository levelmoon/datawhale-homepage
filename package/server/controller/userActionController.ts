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

  analyzeUserAction = async (req: Request, res: Response) => {
    try {
      const { startTime, endTime } = req.query;
      const result = await this.userActionService.analyzeUserAction(
        startTime as string,
        endTime as string
      );
      sendSuccessResponse(res, result, 'get user action successful');
    } catch (e) {
      sendErrorResponse(res, e.message);
    }
  };

  exportUserAction = async (req: Request, res: Response) => {
    try {
      const { startTime, endTime } = req.query;
      const filename = await this.userActionService.exportUserAction(
        startTime as string,
        endTime as string
      );
      sendSuccessResponse(res, `extract user action successful, filename: ${filename}`);
    } catch (e) {
      sendErrorResponse(res, e.message);
    }
  };
}
