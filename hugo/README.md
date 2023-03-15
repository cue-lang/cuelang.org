# Cue - Hugo

This folder contains all hugo code for the website.

## Requirements for local development

- [NodeJS](https://nodejs.org/) `== v18.x`
- [Hugo](https://github.com/gohugoio/hugo/releases) `== v0.108.0`

## Developing the site locally

To serve the site locally go the root and run:

```
./_scripts/serve.bash        # In one terminal
```

If you just want to run the Hugo part. First run

```
npm ci
```

to install all the packages.

After that you can run to start Hugo:

```
npm run hugo
```

## Assets

### Typescript

In the typescript folder (/assets/ts) you have multiple files and folders:

- **helpers** > Includes all helper ts files
- **interfaces** > Includes all interfaces & enums
- **widgets** > We work with a widget system. Each widget can be bound to the html by using data-attributes. All widgets are inside this folder.
- **head.ts** > Simple typescript file to only include stuff that is needed in the head. Only add typescript that specifically needs to be in the head here. All other stuff should be added in main or widgets.
- **main.ts** > This is the main typescript file which maps all widgets and does overall stuff

Hugo compiles this automatically to js.

### SCSS

In the styles folder (/assets/scss) you have multiple files and folders:

- **base** > Overall styling
- **components** > Component styling
- **config** > Scss variables
- **mixins** > Scss mixins
- **main.scss** > This is the main scss file which includes all base scss & components scss

Hugo compiles this automatically to css.

### Icons

If you want to add a new icon to the UI spritesheet you have to add the icon svg to the ui folder: `/assets/svg/ui`

Make sure you cleaned up the icon which means:

- Combine paths if possible
- Make sure all icons are the same size: 24 x 24px viewbox
- Make sure the icon is centered correctly within the viewbox
- Make sure viewBox is used and not width and height!
- Remove unneeded attributes like fill, meta info, comments etc. You can use [SVG OMG](https://jakearchibald.github.io/svgomg/) for this.
- Double check after running it through svgomg if everything is set correctly.

If all above is done and the icon is added in the right folder you can run the following command to update the spritesheet:

```
npm run icons
```

### Linters

To run linters on the project, you can choose from the following script:

| Script                 | What does it do?                                                |
|------------------------|-----------------------------------------------------------------|
| `npm run lint`         | Run the following scripts: ts, sass, and html (not the go-html) |
| `npm run lint-ts`      | Run the typescript linter                                       |
| `npm run lint-sass`    | Run the sass/scss linter                                        |
| `npm run lint-html`    | Run the html linter (./content)                                 |

### Algolia

If you want to test Algolia locally, follow the next steps:

1. Have (admin) access to an Algolia account
2. Create a test index in Algolia
3. Find your Algolia API keys (settings > Team and Access > API Keys),
   fill the keys in the following command,
   and run the command

```
ALGOLIA_APP_ID={{ YOUR_APP_ID }} ALGOLIA_ADMIN_KEY={{ YOUR_ADMIN_KEY }} ALGOLIA_INDEX_NAME={{ YOUR_INDEX_NAME }} ALGOLIA_INDEX_FILE="../_public/algolia.json" npm run algolia
```

4. Do your testing
5. Delete the test index

## History

This site was setup using the following guides:

- https://gohugo.io/hosting-and-deployment/hosting-on-netlify/
- https://www.docsy.dev/docs/getting-started
- https://www.docsy.dev/docs/deployment/
