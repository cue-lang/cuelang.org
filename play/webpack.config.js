const path = require('path');

const HtmlWebpackPlugin = require('html-webpack-plugin');

let distRoot = path.join(__dirname, "..");

let distDir = path.join(distRoot, '_public', 'play');

module.exports = {
	entry: './src/index.tsx',

	resolve: {
		extensions: ['.ts', '.tsx', '.js']
	},

	output: {
		path: distDir,
		filename: 'bundle.min.js'
	},

	// So that we don't get reminded how large the compiled
	// Go output is.
	performance: { hints: false },

	module: {
		rules: [
			{ test: /\.tsx?$/, loader: 'ts-loader' },
			{ test: /\.(s*)css$/, use:['style-loader','css-loader'] },
			{ test: /\.wasm$/, loader: 'file-loader', type: 'javascript/auto', options: {
				name: '[name].[ext]'
			} },
		]
	},

	plugins: [
		new HtmlWebpackPlugin({
			template: './src/index.html'
		})
	]
}
