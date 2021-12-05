module.exports = {
  presets: [
    [
      '@babel/preset-env',
      {
        targets: {
          browsers: ['last 2 chrome version'],
          useBuiltIns: 'usage',
          corejs: 3,
        },
      },
    ],
    [
      '@babel/preset-typescript',
      {
        allExtensions: true,
      },
    ],
  ],
}
