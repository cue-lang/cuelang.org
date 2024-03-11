// package repo contains data values that are common to all CUE configurations
// in this repo. This not only includes GitHub workflows, but also things like
// gerrit configuration etc.
package repo

import (
	"github.com/cue-lang/cuelang.org/internal/ci/base"
)

base

githubRepositoryPath: "cue-lang/cuelang.org"

alphaBranch: "alpha"

defaultBranch: _
protectedBranchPatterns: [defaultBranch, alphaBranch]

botGitHubUser:      "cueckoo"
botGitHubUserEmail: "cueckoo@gmail.com"

linuxMachine: "ubuntu-22.04"
macosMachine: "macos-13"

// Use a specific latest version for release builds.
// Note that we don't want ".x" for the sake of reproducibility,
// so we instead pin a specific Go release.
goVersion: "1.22.0"

// Use a specific version of NodeJS for deploy purposes. This version
// is consistent between netlify and GitHub Actions usage.
nodeVersion: "20.9.0"

// hugoVersion is the version of hugo used in generating our static site
hugoVersion: "0.123.8"

// netlifyCLIVersion is the version of the Netlify CLI used to deploy tip and
// deploy previews of CLs
netlifyCLIVersion: "17.0.1"

netlifySites: {
	cls: "cue-cls"
	tip: "cue-tip"
}
