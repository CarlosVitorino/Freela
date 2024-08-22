//process.env.GENERATE_SOURCEMAP = 'false';

const CracoLessPlugin = require('craco-less');
const CracoEsbuildPlugin = require('craco-esbuild');
const { theme } = require('antd/lib');
const { convertLegacyToken, defaultTheme } = require('@ant-design/compatible/lib');
const AntdMomentWebpackPlugin = require('@ant-design/moment-webpack-plugin');

const { defaultAlgorithm, defaultSeed } = theme;

const mapV5Token = defaultAlgorithm(defaultSeed);
const v5Vars = convertLegacyToken(mapV5Token);
const mapV4Token = theme.getDesignToken(defaultTheme);
const v4Vars = convertLegacyToken(mapV4Token);


module.exports = {
    plugins: [
        {
            plugin: CracoLessPlugin,
            options: {
                lessLoaderOptions: {
                    lessOptions: {
                        modifyVars: {
                          ...v4Vars,
                          "@primary-color": "#30b2bc", // primary color for all components
                          "@link-color": "#30b2bc", // link color
                          "@success-color": "#52c41a", // success state color
                          "@warning-color": "#faad14", // warning state color
                          "@error-color": "#f5222d", // error state color
                          "@font-size-base": "14px", // major text font size
                          "@heading-color": "rgba(0, 0, 0, 0.85)", // heading text color
                          "@text-color": "rgba(0, 0, 0, 0.65)", // major text color
                          "@text-color-secondary": "rgba(0, 0, 0, 0.45)", // secondary text color
                          "@disabled-color": "rgba(0, 0, 0, 0.25)", // disable state color
                          "@border-radius-base": "2px", // major border radius
                          "@border-color-base": "#d9d9d9", // major border color
                          "@box-shadow-base":
                            "0 3px 6px -4px rgba(0, 0, 0, 0.12), 0 6px 16px 0 rgba(0, 0, 0, 0.08) 0 9px 28px 8px rgba(0, 0, 0, 0.05)", // major shadow for layers
                          "@layout-body-background": "transparent",
                          "@layout-footer-background": "#EFF8FF",
                          "@layout-header-background": "#FFFFFF",
                          "@layout-trigger-color": "#002140",
                          "@layout-zero-trigger-height": "64px",
                          "@layout-zero-trigger-width": "70px",
                        },
                        javascriptEnabled: true,
                    },
                },
            },
        },
        {
            plugin: CracoEsbuildPlugin,
            options: {
              esbuildLoaderOptions: {
                // Optional. Defaults to auto-detect loader.
                loader: 'jsx', // Set the value to 'tsx' if you use typescript
                target: 'es2015',
              },
              esbuildMinimizerOptions: {
                // Optional. Defaults to:
                target: 'es2015',
                css: true, // if true, OptimizeCssAssetsWebpackPlugin will also be replaced by esbuild.
              },
              skipEsbuildJest: false, // Optional. Set to true if you want to use babel for jest tests,
              esbuildJestOptions: {
                loaders: {
                  '.ts': 'ts',
                  '.tsx': 'tsx',
                },
              },
            },
          },
    ],
    webpack: {
      plugins: {
        add: [new AntdMomentWebpackPlugin()],
      },
    },
};
