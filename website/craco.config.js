const CracoLessPlugin = require('craco-less');
const CracoEsbuildPlugin = require('craco-esbuild');
const { theme } = require('antd/lib');
const { convertLegacyToken, defaultTheme } = require('@ant-design/compatible/lib');

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
                        modifyVars: v5Vars, // or v4Vars
                        javascriptEnabled: true,
                    },
                },
            },
        },
        {
            plugin: CracoEsbuildPlugin,
            options: {
              includePaths: ['/external/dir/with/components'], // Optional. If you want to include components which are not in src folder
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
};
