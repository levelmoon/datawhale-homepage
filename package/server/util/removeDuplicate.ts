export const removeDuplicateItem = (arr: Array<any>) => {
  return Array.from(new Set(arr));
};
