## CUE Playground

The CUE Playground is a [TypeScript](https://www.typescriptlang.org/) application that is backed by a [WASM-compiled
Go](https://github.com/golang/go/wiki/WebAssembly) application. [React](https://reactjs.org/) is used to render the UI,
with [Bootstrap](https://getbootstrap.com/) providing the styling.

For now we use a simple three-pane UI:

```
+------------------------------------------------------------------+
|                                                                  |
|  Header                                                          |
|                                                                  |
+---------------------------------+--------------------------------+
|                                 |                                |
|  Input                          |    Output                      |
|                                 |                                |
+---------------------------------+--------------------------------+
```

The output is the JSON-marshalled result of the CUE input.

### Details

* The TypeScript single-page application entry point is `src/index.tsx`
* The entire application runs via a [Webpack](https://webpack.js.org/) pipeline
* ...

### Requirements for local development

* [NodeJS](https://nodejs.org/) `>= v18.14.0`
* [Go](https://golang.org/dl/) (stable version)

### Developing the site locally
To install the packages, build the main wasm file & serve the playground locally, run:

```
./_scripts/run.bash
```

You can now go to `http://localhost:3000/` to view the playground.

If you don't want to reinstall node-modules and rebuild wasm files every time you can also install the node modules

```
npm ci
```

And then run:

```
npm run start
```
This will build webpack in dev mode and serve the application.
You do need the wasm file to get the playground running so make sure you've run the bash command at least once.

* UI/UX
  * Support `fmt` and `trim` dropdown button option for the input pane contents
  * Support `txtar` input that then gets used as an overlay
  * Extend input dropdown to support different types of input (CUE, JSON, Yaml, Go)
  * Extend output dropdown modes
* Development improvements
  * Integrate automatic recompilation of `main.wasm` into the webpack watch pipeline
  * Ensure, via GitHub Action checks, that `.go` and `.tsx` files are formatted
