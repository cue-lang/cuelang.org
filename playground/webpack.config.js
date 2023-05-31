const path = require('path');

const CopyPlugin = require('copy-webpack-plugin');
const HtmlWebpackPlugin = require('html-webpack-plugin');
const TerserPlugin = require('terser-webpack-plugin');
const TsconfigPathsPlugin = require('tsconfig-paths-webpack-plugin');

const distPath = path.join(__dirname, '_dist');
module.exports = (env, argv) => {
    const config = {
        mode: 'production',
        entry: [
            path.resolve(__dirname, './src/wasm_exec.js'),
            path.resolve(__dirname, './src/index.tsx'),
            path.resolve(__dirname, './src/scss/dev.scss'),
            path.resolve(__dirname, './src/scss/main.scss'),
        ],
        output: {
            path: distPath,
            filename: 'bundle.min.js',
        },
        optimization: {
            minimize : true,
            minimizer: [
                new TerserPlugin({
                    extractComments: false,
                }),
            ],
        },
        cache: {
            type: 'filesystem',
            cacheDirectory: path.resolve(__dirname, '.webpack_cache'),
        },
        plugins: [
            new HtmlWebpackPlugin({
                template: './src/index.html'
            }),
            new CopyPlugin({
                patterns: [
                    {
                        from: path.resolve(__dirname, './main.wasm'),
                    },
                    {
                        from: path.resolve(__dirname, './src/static'),
                    },
                ],
            }),
        ],
        resolve: {
            extensions: ['.ts', '.tsx', '.js'],
            plugins: [new TsconfigPathsPlugin()],
        },
        performance: { hints: false },  // So that we don't get reminded how large the compiled Go output is.
        watch: false,
        module: {
            rules: [
                {
                    test: /\.tsx?$/,
                    loader: 'ts-loader'
                },
                {
                    test: /\.css$/,
                    use: ['style-loader', 'css-loader'],
                },
                {
                    test: /\.scss$/,
                    use: [
                        {
                            loader: 'file-loader',
                            options: { name: '[name].css'}
                        },
                        'sass-loader'
                    ]
                },
                {
                    test: /\.wasm$/,
                    loader: 'file-loader',
                    type: 'javascript/auto',
                    options: {
                        name: '[name].[ext]'
                    }
                },
            ]
        },
    };

    if (argv.mode === 'development') {
        config.mode = 'development';
        config.devtool = 'inline-source-map';
        config.optimization.minimize = false;
        config.watch = true;
        config.devServer = {
            static: {
                directory: distPath,
            },
            port: 3000,
        }
    }

    return config;
}
