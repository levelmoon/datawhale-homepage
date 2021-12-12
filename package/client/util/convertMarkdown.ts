import MarkdownIt from 'markdown-it';
import MarkdownItKatex from '@iktakahiro/markdown-it-katex';

const md = new MarkdownIt({ breaks: true });
md.use(MarkdownItKatex, { globalGroup: true, enableBareBlocks: true });

export const convertMarkdownToHtml = (markdown: string) => {
  const html = md.render(markdown);
  return html;
};
