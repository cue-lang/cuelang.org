package site
{
	content: {
		docs: {
			draft: {
				"cbe-001_github_actions_importing_workflows": {
					page: {
						cache: {
							upload: {
								"4":  "rH9G8O8sZOzfuYm67zT3zcHOzkw3gtdxGMTQxVE45BU="
								"5":  "mwneabnhj3lX2j1Iq237u/URTcOwKhv0nZ7QDYbMSxk="
								"10": "vCxqz2jIsIaFqwsKEb0le/VdRjwQJPEo/Ib4ZrPPvdM="
								"11": "uE7qBTJmkpWb3RIQuFnqq01mmM98SULj3M8nRHc8gn0="
								"12": "l2tEfPQUVfQvv2ZUjHnxnKOPoR0rkhGcgQTHrEsHdus="
								"14": "4QH8PxJG9gE58h8gqrbqff9JMGPJE209TaTxHl/9gVo="
							}
							multi_step: {
								hash:       "GPSNM25CEG49V8229N3C9BHUGN08CU4GFS0M5AOT8JUPK120QFE0===="
								scriptHash: "V6MFVA50A0EO31MT02SEL74V4D5N9JGMMGHCME73JE06JLCRC260===="
								steps: [{
									doc:      "# Required to interact with the central registry."
									cmd:      "mkdir -p $HOME/.config/cue"
									exitCode: 0
									output:   ""
								}, {
									doc: ""
									cmd: """
											cat <<EOD >$HOME/.config/cue/logins.json
											{"registries":{"registry.cue.works":{"access_token":"${TEST_USER_AUTHN_CUE_USER_NEW}","token_type":"Bearer"}}}
											EOD
											"""
									exitCode: 0
									output:   ""
								}, {
									doc:      "# Set up example content as a git repo."
									cmd:      "cd github-actions-example"
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "git init ."
									exitCode: 0
									output: """
											...

											"""
								}, {
									doc:      ""
									cmd:      "git config user.email cuelang.org@cue.example"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "git config user.name cuelang.org"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "git add ."
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "git commit -m \"Initial commit\" >/dev/null"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cd .."
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cd github-actions-example # our example repository"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "git status # should report \"working tree clean\""
									exitCode: 0
									output: """
											On branch master
											nothing to commit, working tree clean

											"""
								}, {
									doc:      ""
									cmd:      "cue mod init github.com/cue-examples/github-actions-example"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue import ./.github/workflows/ --with-context -p github -f -l workflows: -l 'strings.TrimSuffix(path.Base(filename),path.Ext(filename))'"
									exitCode: 0
									output:   ""
								}, {
									doc: """
											# Actual command in CUE-By-Example guide:
											# ls .github/workflows/
											"""
									cmd:      "ls .github/workflows/ >../4.actual.txt"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff ../4.actual.txt ../4.expected.txt"
									exitCode: 0
									output:   ""
								}, {
									doc: """
											# Actual command in CUE-By-Example guide:
											# head -5 .github/workflows/*.cue
											"""
									cmd:      "head -5 .github/workflows/*.cue >../5.actual.txt"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff ../5.actual.txt ../5.expected.txt"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "mkdir -p internal/ci/github"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "mv ./.github/workflows/*.cue internal/ci/github"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue mod get github.com/cue-tmp/jsonschema-pub/exp1/githubactions@v0.3.0"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c ./internal/ci/github"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cd $(git rev-parse --show-toplevel) # make sure we're sitting at the repository root"
									exitCode: 0
									output:   ""
								}, {
									doc: """
											# Actual command in CUE-By-Example guide:
											# cue help cmd regenerate ./internal/ci/github   # the "./" prefix is required
											"""
									cmd:      "cue help cmd regenerate ./internal/ci/github | head -4 >../12.actual.txt"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff ../12.actual.txt ../12.expected.txt"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue cmd regenerate ./internal/ci/github # the \"./\" prefix is required"
									exitCode: 0
									output:   ""
								}, {
									doc: """
											# Actual command in CUE-By-Example guide:
											# git diff .github/workflows/
											"""
									cmd:      "git diff .github/workflows/ | grep -v '^index [0-9a-f]{7}\\.\\.[0-9a-f]{7}' >../14.actual.txt"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "git add .github/workflows/ internal/ci/github/ cue.mod/module.cue"
									exitCode: 0
									output:   ""
								}, {
									doc: """
											# Actual command in CUE-By-Example guide:
											# git commit -m "ci: create CUE sources for GHA workflows"
											"""
									cmd:      "git commit --quiet -m \"ci: create CUE sources for GHA workflows\""
									exitCode: 0
									output:   ""
								}]
							}
						}
					}
				}
			}
		}
	}
}
