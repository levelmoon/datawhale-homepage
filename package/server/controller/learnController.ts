import { Request, Response } from 'express';
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
      sendSuccessResponse(res, output);
    } catch (e) {
      sendErrorResponse(res, e.message);
    }
  };

  getLearn = async (req: Request, res: Response) => {
    try {
      const { learnId } = req.query;
      let output: ILearnItem[];
      if (learnId === undefined) {
        output = await this.learnService.findLearn({});
      } else {
        const learnIdNum = parseInt(learnId as string);
        output = await this.learnService.findLearn({ where: { id: learnIdNum } });
      }

      sendSuccessResponse(res, output);
    } catch (e) {
      sendErrorResponse(res, e.message);
    }
  };

  getLearnByTag = async (req: Request, res: Response) => {
    try {
      const { tagId } = req.query;
      const tagIdNum = parseInt(tagId as string);
      const output = await this.learnService.findLearnByTag({ where: { learnTagId: tagIdNum } });

      sendSuccessResponse(res, output);
    } catch (e) {
      sendErrorResponse(res, e.message);
    }
  };

  getLearnDetail = async (req: Request, res: Response) => {
    try {
      const { learnId, chapterId } = req.query;
      const learnIdNum = parseInt(learnId as string);
      const chapterIdNum = parseInt(chapterId as string);
      const output = await this.learnService.findLearnDetail(learnIdNum, chapterIdNum);

      sendSuccessResponse(res, output);
    } catch (e) {
      sendErrorResponse(res, e.message);
    }
  };

  getLearnVideo = async (req: Request, res: Response) => {
    try {
      const { learnId } = req.query;
      const learnIdNum = parseInt(learnId as string);
      const output = await this.learnService.findLearnVideo(learnIdNum);

      sendSuccessResponse(res, output);
    } catch (e) {
      sendErrorResponse(res, e.message);
    }
  };
}

interface ILearnItem {
  id: number;
  name: string;
  description: string;
  imageUrl: string;
  like: number;
  tagList: { tagId: number; tagName: string }[];
  detailList: { chapterId: number; title: string }[];
}
