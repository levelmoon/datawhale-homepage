import { Request, Response } from 'express';
import { KnowledgeService } from '../service/knowledgeService';
import { MoreThan } from 'typeorm';
import { sendSuccessResponse, sendErrorResponse } from '../util/response';

export class KnowledgeController {
  private knowledgeService = new KnowledgeService();

  getKnowledge = async (req: Request, res: Response) => {
    try {
      // 获取知识体系内容
      const output = await this.knowledgeService.findAvailableKnowledge();

      return sendSuccessResponse(res, output);
    } catch (e) {
      res.send(e.message);
    }
  };
}
