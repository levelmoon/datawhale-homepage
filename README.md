# 【WIP】datawhale 官网项目

## 一、技术选型
- 编程语言：typescript
- 前端框架：vue3
- 前端组件库：element-plus
- 流程图绘制库：antv-g6
- markdown-to-html解析库：markdown-it
- 后端框架：express
- orm框架：typeorm

## 二、目录结构
|文件目录|说明|
|-|-|
|./README.md|说明文档|
|./deploy|服务器部署/数据库dump|
|./package|源代码|
|./package/client|前端源代码|
|./package/server|后端源代码|

## 三、开发指南
使用`yarn`命令安装依赖
使用`dev:all`命令进行开发，访问`localhost:8080`即可看到网站
使用`build:all`命令进行打包

## 四、后续todo
- 1、用户体系搭建
- 2、seo优化
  - 可以将csr渲染改为ssr渲染
  - 或将学习内容拆成ssg单独部署
- 3、后端接口的补充
  - 现在后端只写了查询接口
  - 需要额外补充创建和更新的接口
- 4、前端性能优化
  - 写的比较快糙猛，
  - 诸如bundle懒加载、依赖tree-shaking这种常规优化点都可以做一下。
- 5、完善日志和监控
  - 前端埋点使用shadow-tracker上报
  - 后端接口丰富日志