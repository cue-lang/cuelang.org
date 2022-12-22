package core

import (
	"strings"
)

// Define core URLs that will be used in the codereview.cfg and GitHub workflows
#githubRepositoryURL: "https://github.com/cue-lang/cuelang.org"
#gerritRepositoryURL: "https://review.gerrithub.io/a/cue-lang/cuelang.org"

// Use a specific latest version for release builds.
// Note that we don't want ".x" for the sake of reproducibility,
// so we instead pin a specific Go release.
#goVersion: "1.19.3"

// Use a specific version of NodeJS for deploy purposes. This version
// is consistent between netlify and GitHub Actions usage.
#nodeVersion: "18.8.0"

// hugoVersion is the version of hugo used in generating our static site
#hugoVersion: "0.89.4"

// netlifyCLIVersion is the version of the Netlify CLI used to deploy tip and
// deploy previews of CLs
#netlifyCLIVersion: "12.4.0"

#netlifySites: {
	cls: "cue-cls"
	tip: "cue-tip"
}

#codeReview: {
	gerrit?: string
	github?: string
	unity?:  string
}

codeReview: #codeReview & {
	github: #githubRepositoryURL
	gerrit: #gerritRepositoryURL
}

// #toCodeReviewCfg converts a #codeReview instance to
// the key: value
#toCodeReviewCfg: {
	#input: #codeReview
	let parts = [ for k, v in #input {k + ": " + v}]

	// Per https://pkg.go.dev/golang.org/x/review/git-codereview#hdr-Configuration
	strings.Join(parts, "\n")
}
