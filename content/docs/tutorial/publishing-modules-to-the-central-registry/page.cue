package site

content: docs: tutorial: "publishing-modules-to-the-central-registry": page: {
	testUserAuthn: ["cue-user-collaborator-rw"]
	vars: {
		MODULE1: {
			pattern:     "github.com/cue-labs-modules-testing/docs-public-repo/myfirstmodule-${xxxxxxxx}/frostyconfig"
			replacement: "github.com/cueckoo/frostyconfig"
		}
		MODULE2: {
			pattern:     "github.com/cue-labs-modules-testing/docs-public-repo/myfirstmodule-${xxxxxxxx}/frostyapp"
			replacement: "github.com/cueckoo/frostyapp"
		}
	}
}
