import path from 'path';
import { Configuration } from 'webpack';
import HtmlWebpackPlugin from 'html-webpack-plugin';
import MiniCssExtractPlugin from 'mini-css-extract-plugin';

const isDevEnv = () => process.env.NODE_ENV === 'development';

const useCssPlugin = () => !isDevEnv();

const baseConifg: Configuration = {
  entry: {
    dashboard: {
      import: path.join(__dirname, `../src/index.tsx`),
    },
  },
  mode: isDevEnv() ? 'development' : 'production',
  output: {
    filename: '[name].js',
    chunkFilename: '[name]~[chunkhash:5].chunk.js',
    path: path.resolve(__dirname, '..', './public'),
    publicPath: '/',
  },
  module: {
    rules: [
      {
        test: /\.(j|t)sx?$/,
        exclude: /node_modules/,
        use: [
          {
            loader: 'babel-loader',
            options: {
              presets: [
                '@babel/preset-env',
                '@babel/preset-typescript',
                '@babel/preset-react',
              ],
              plugins: [
                [
                  'import',
                  {
                    libraryName: 'antd',
                    style: true, // or 'css'
                  },
                  'antd',
                ],
                [
                  'import',
                  {
                    libraryName: '@vesoft-inc/ui',
                    style: true,
                    camel2DashComponentName: false,
                  },
                  'vesoft-ui',
                ],
              ],
            },
          },
        ],
        include: path.join(__dirname, `../../`),
      },
      {
        test: /\.css$/,
        use: [
          useCssPlugin() ? MiniCssExtractPlugin.loader : 'style-loader',
          'css-loader',
          'postcss-loader',
        ],
      },
      {
        test: /(?<!module)\.less$/,
        use: [
          useCssPlugin() ? MiniCssExtractPlugin.loader : 'style-loader',
          'css-loader',
          'postcss-loader',
          {
            loader: 'less-loader',
            options: {
              lessOptions: {
                modifyVars: {
                  'primary-color': '#4372FF',
                  'link-color': '#4372FF',
                },
                javascriptEnabled: true,
              },
            },
          },
        ],
      },
      {
        test: /\.module\.less$/,
        exclude: /node_modules/,
        use: [
          useCssPlugin() ? MiniCssExtractPlugin.loader : 'style-loader',
          {
            loader: 'css-loader',
            options: {
              modules: {
                mode: 'local',
                exportGlobals: true,
                localIdentName: '[local]__[hash:base64:5]',
                localIdentContext: path.resolve(__dirname, '..', 'src'),
                exportLocalsConvention: 'camelCase',
              },
            },
          },
          {
            loader: 'postcss-loader',
          },
          {
            loader: 'less-loader',
            options: { lessOptions: { javascriptEnabled: true } },
          },
        ],
      },
      {
        test: /\.(woff|woff2|ttf)(\?t=\d+)?$/,
        use: [
          {
            loader: 'file-loader',
            options: {
              name: '[path][name].[ext]',
              esModule: false,
            },
          },
        ],
      },
      {
        test: /\.(png|jpg|gif|svg|webp)$/,
        type: 'asset/resource',
        generator: {
          filename: 'static/[hash][ext][query]',
        },
      },
      {
        test: /\.(woff|woff2|ttf)(\?t=\d+)?$/,
        type: 'asset/resource',
      },
    ],
  },
  resolve: {
    extensions: ['.tsx', '.ts', '.jsx', '.js', '.json', '.less'],
    alias: {
      '@': path.join(__dirname, '../src'),
    },
  },
  plugins: [
    new HtmlWebpackPlugin({
      template: path.join(__dirname, '../index.html'),
      title: 'Website',
      favicon: path.join(__dirname, '../favicon.ico'),
    }),
  ],
  externals: {
    "moment": "var window.moment",
    "lodash": "var window._"
  }
};

export { baseConifg };
