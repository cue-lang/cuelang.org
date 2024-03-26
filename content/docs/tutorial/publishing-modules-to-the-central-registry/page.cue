package site

content: docs: tutorial: "publishing-modules-to-the-central-registry": page: {
	testUserAuthn: ["cue-user-collaborator-rw"]
	vars: {
		MODULE1: {
			pattern:     "github.com/cue-labs-modules-testing/docs-public-repo-${xxxxxxxx}"
			replacement: "github.com/my/example"
		}
	}
}
