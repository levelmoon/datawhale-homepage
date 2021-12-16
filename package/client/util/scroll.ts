export const HEADER_HEIGHT = 61;

export const isInViewPort = (element: HTMLElement | null) => {
  if (!element) {
    return false;
  }
  const { bottom } = element.getBoundingClientRect();
  return bottom >= HEADER_HEIGHT;
};
