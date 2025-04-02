package site

content: docs: draft: cldd: "publishing-modules-to-the-central-registry": page: {
	testUserAuthn: ["cue-user-collaborator-rw"]
	vars: {
		githubUser:  "cueckoo"
		module1Repo: "frostyconfig"
		MODULE1: {
			pattern:     "github.com/cue-labs-modules-testing/docs-public-repo/myfirstmodule-${xxxxxxxx}/frostyconfig"
			replacement: "github.com/\(githubUser)/\(module1Repo)"
		}
		MODULE2: {
			pattern:     "github.com/cue-labs-modules-testing/docs-public-repo/myfirstmodule-${xxxxxxxx}/frostyapp"
			replacement: "github.com/\(githubUser)/frostyapp"
		}
	}
}
