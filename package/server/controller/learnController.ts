import e, { Request, Response } from 'express';
import { sendSuccessResponse, sendErrorResponse } from '../util/response';
import { LearnService } from '../service/learnService';

export class LearnController {
  private learnService = new LearnService();

  getAllTag = async (req: Request, res: Response) => {
    try {
      const tagList = await this.learnService.findTag({});
      const output = tagList.map((item) => {
        return {
          tagId: item.id,
          name: item.name
        };
      });
      return sendSuccessResponse(res, output);
    } catch (e) {
      res.send(e.message);
    }
  };

  getLearn = async (req: Request, res: Response) => {
    try {
      const { learnId } = req.query;
      let output;
      if (learnId === undefined) {
        output = await this.learnService.findLearn({});
      } else {
        const learnIdNum = parseInt(learnId as string);
        output = await this.learnService.findLearn({ where: { id: learnId } });
      }

      return sendSuccessResponse(res, output);
    } catch (e) {
      res.send(e.message);
    }
  };

  getLearnByTag = async (req: Request, res: Response) => {
    try {
      const { tagId } = req.query;
      const tagIdNum = parseInt(tagId as string);
      const output = await this.learnService.findLearnByTag({ where: { id: tagIdNum } });

      return sendSuccessResponse(res, output);
    } catch (e) {
      res.send(e.message);
    }
  };

  getLearnDetail = async (req: Request, res: Response) => {
    try {
      const { learnId, chapterId } = req.query;
      const learnIdNum = parseInt(learnId as string);
      const chapterIdNum = parseInt(chapterId as string);
      const output = await this.learnService.findLearnDetail(learnIdNum, chapterIdNum);

      return sendSuccessResponse(res, output);
    } catch (e) {
      res.send(e.message);
    }
  };

  getLearnVideo = async (req: Request, res: Response) => {
    try {
      const { learnId } = req.query;
      const learnIdNum = parseInt(learnId as string);
      const output = await this.learnService.findLearnVideo(learnIdNum);

      return sendSuccessResponse(res, output);
    } catch (e) {
      res.send(e.message);
    }
  };
}
