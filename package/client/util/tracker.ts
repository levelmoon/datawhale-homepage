import tracker from 'shadow-tracker';

export const initTracker = () => {
  tracker.init();
  window.tracker = tracker;
};

export const getTracker = () => {
  return tracker;
};
