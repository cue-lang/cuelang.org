package site

content: docs: tutorial: "carving-out-submodule": page: {
	testUserAuthn: ["cue-user-collaborator-rw"]
	vars: {
		githubUser: "cueckoo"
		module1:    "mod1"
		main:       "main"
		MODULE1: {
			pattern:     "github.com/cue-labs-modules-testing/docs-public-repo/carveoutsubmodule-${xxxxxxxx}/\(module1)"
			replacement: "github.com/\(githubUser)/\(module1)"
		}
	}
}
