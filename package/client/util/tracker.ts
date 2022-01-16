import tracker from 'shadow-tracker';
import fingerprintJS from '@fingerprintjs/fingerprintjs';

export const initTracker = async () => {
  const fingerprint = await fingerprintJS.load({ monitoring: false });
  const result = await fingerprint.get();

  tracker.init({
    sessionId: result.visitorId,
    captureEvents: true,
    captureJsError: false,
    captureXMLHttpRequest: false
  });
  tracker.getDeviceInfo();
  tracker.getPerformanceInfo();
  window.tracker = tracker;
};
