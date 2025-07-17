// package repo contains data values that are common to all CUE configurations
// in this repo. This not only includes GitHub workflows, but also things like
// gerrit configuration etc.
package repo

import (
	"github.com/cue-lang/tmp/internal/ci/base"
)

base

githubRepositoryPath: "cue-lang/cuelang.org"

defaultBranch: _
protectedBranchPatterns: [defaultBranch]

botGitHubUser:      "cueckoo"
botGitHubUserEmail: "cueckoo@gmail.com"

// Use a specific latest version for release builds.
// Note that we don't want ".x" for the sake of reproducibility,
// so we instead pin a specific Go release.
goVersion: "1.24.5"

// Use a specific version of NodeJS for deploy purposes. This version
// is consistent between netlify and GitHub Actions usage.
nodeVersion: "22.17.1"

// hugoVersion is the version of hugo used in generating our static site
hugoVersion: "0.147.9"

// netlifyCLIVersion is the version of the Netlify CLI used to deploy tip and
// deploy previews of CLs
netlifyCLIVersion: "20.1.1"

netlifySites: {
	cls: "cue-cls"
}

env: {}

cueCommand: "go run cuelang.org/go/cmd/cue"
