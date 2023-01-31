import merge from 'webpack-merge';
import webpack from 'webpack';

import { baseConifg } from './webpack.config.base';

const devConfig: any = {
  devtool: 'inline-source-map',
  mode: 'development',
  devServer: {
    proxy: {
      '/erupt-api': {
        target: 'http://localhost:8080/',
        changeOrigin: true,
      },
    },
    devMiddleware: {
      index: 'index.html',
      publicPath: '/',
    },
    compress: false,
    historyApiFallback: true,
    hot: true,
    port: 7000,
  },
  plugins: [
    new webpack.HotModuleReplacementPlugin(),
    new webpack.ProgressPlugin(),
  ],
};

const finalConfig = merge(baseConifg, devConfig);

export default finalConfig;
