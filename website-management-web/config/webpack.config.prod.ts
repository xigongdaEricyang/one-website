import path from 'path';
import { CleanWebpackPlugin } from 'clean-webpack-plugin';
import MiniCssExtractPlugin from 'mini-css-extract-plugin';
import TerserPlugin from 'terser-webpack-plugin';
import { Configuration } from 'webpack';
import merge from 'webpack-merge';
import packageJson from '../package.json';

import { baseConifg } from './webpack.config.base';

const publicConfig: Configuration = {
  mode: 'production',
  output: {
    path: path.join(__dirname, '../../src/main/resources/public/web'),
    filename: `${packageJson.version}/[name].js`,
    chunkFilename: `${packageJson.version}/[name].js`,
    publicPath: '/web',
  },
  module: {
    rules: [
      {
        test: /\.css$/,
        use: [MiniCssExtractPlugin.loader, 'css-loader'],
      },
    ],
  },
  optimization: {
    minimizer: [new TerserPlugin()],
    runtimeChunk: 'single',
    splitChunks: {
      cacheGroups: {
        vendors: {
          name: 'vendors',
          test: /node_modules/,
          chunks: 'all',
        },
      },
    },
  },

  plugins: [
    new CleanWebpackPlugin(),

    new MiniCssExtractPlugin({
      filename: `${packageJson.version}/[name].css`,
      chunkFilename: `${packageJson.version}/[id].css`,
    }),
  ],
};

const finalConfig = merge(baseConifg, publicConfig);

export default finalConfig;
