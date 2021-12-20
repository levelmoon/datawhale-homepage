import { Request, Response } from 'express';
import { KnowledgeService } from '../service/knowledgeService';
import { sendSuccessResponse, sendErrorResponse } from '../util/response';

export class KnowledgeController {
  private knowledgeService = new KnowledgeService();

  getKnowledge = async (req: Request, res: Response) => {
    try {
      // 获取知识体系内容
      const output = await this.knowledgeService.findAvailableKnowledge();

      sendSuccessResponse(res, output);
    } catch (e) {
      sendErrorResponse(res, e.message);
    }
  };
}
