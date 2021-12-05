import express from 'express'
import { HomepageController } from './controller/homepageController'
import { ActivityController } from './controller/activityController'

export const getRouter = () => {
  const homepageController = new HomepageController()
  const activityController = new ActivityController()

  const router = express.Router()

  router.get('/', homepageController.helloWorld)
  router.get('/homepage', homepageController.getHomepageData)
  router.get('/activity', activityController.findAvailableActivity)

  return router
}
