import express from 'express';
import { HomepageController } from './controller/homepageController';
import { LearnController } from './controller/learnController';

export const getRouter = () => {
  const homepageController = new HomepageController();
  const learnController = new LearnController();

  const router = express.Router();

  router.get('/', homepageController.helloWorld);
  router.get('/homepage', homepageController.getHomepageData);
  router.get('/learn', learnController.getLearn);
  router.get('/learn/tag', learnController.getAllTag);
  router.get('/learn/getByTag', learnController.getLearnByTag);
  router.get('/learn/detail', learnController.getLearnDetail);
  router.get('/learn/video', learnController.getLearnVideo);

  return router;
};
