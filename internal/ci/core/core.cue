// package core contains data values that are commont to all CUE
// configurations.  This not only includes GitHub workflows, but also things
// like gerrit configuration etc.
package core

import (
	"list"
	"strings"
)

// Define core URLs that will be used in the codereview.cfg and GitHub workflows
githubRepositoryURL:  "https://github.com/cue-lang/cuelang.org"
gerritRepositoryURL:  "https://review.gerrithub.io/a/cue-lang/cuelang.org"
githubRepositoryPath: _#URLPath & {#url: githubRepositoryURL, _}

// Not ideal, but hack together something that gives us the path
// of a URL. In lieu of cuelang.org/issue/1433
_#URLPath: {
	#url: string
	let parts = strings.Split(#url, "/")
	strings.Join(list.Slice(parts, 3, len(parts)), "/")
}

// Use a specific latest version for release builds.
// Note that we don't want ".x" for the sake of reproducibility,
// so we instead pin a specific Go release.
goVersion: "1.19.4"

// Use a specific version of NodeJS for deploy purposes. This version
// is consistent between netlify and GitHub Actions usage.
nodeVersion: "18.12.1"

// hugoVersion is the version of hugo used in generating our static site
hugoVersion: "0.108.0"

// netlifyCLIVersion is the version of the Netlify CLI used to deploy tip and
// deploy previews of CLs
netlifyCLIVersion: "12.4.0"

netlifySites: {
	cls: "cue-cls"
	tip: "cue-tip"
}

#codeReview: {
	gerrit?: string
	github?: string
	unity?:  string
}

codeReview: #codeReview & {
	github: githubRepositoryURL
	gerrit: gerritRepositoryURL
}

// #toCodeReviewCfg converts a #codeReview instance to
// the key: value
#toCodeReviewCfg: {
	#input: #codeReview
	let parts = [ for k, v in #input {k + ": " + v}]

	// Per https://pkg.go.dev/golang.org/x/review/git-codereview#hdr-Configuration
	strings.Join(parts, "\n")
}
