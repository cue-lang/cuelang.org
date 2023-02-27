# Cue - Hugo

This folder contains all hugo code for the website.

## Requirements for local development

* [NodeJS](https://nodejs.org/) `== v18.x`
* [Hugo](https://github.com/gohugoio/hugo/releases) `== v0.108.0`

## Developing the site locally
To serve the site locally go the root and run:

```
./serve.bash        # In one terminal
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

To create the icon spritesheet after adding new icons to the assets/svg folder run:
```
npm run icons
```

## History

This site was setup using the following guides:

* https://gohugo.io/hosting-and-deployment/hosting-on-netlify/
* https://www.docsy.dev/docs/getting-started
* https://www.docsy.dev/docs/deployment/
