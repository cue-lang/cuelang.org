package site
{
	content: {
		docs: {
			draft: {
				"cbe-001_github_actions_importing_workflows": {
					page: {
						cache: {
							upload: {
								"4":  "m0HDGhho3aQ6Ub1L0gpgkV0I+o+CVJrI3s3Pbo6AgS8="
								"5":  "jKbYake1kKkOS13RCSVngsSoOA4P3mrSXQnbaJsHtk4="
								"10": "qAqXvcpHRmcxOOIsx4RXhYEU9ygo+VzM6UeK8ty1lDw="
								"11": "xzJw+15yQkNZTfAHxyBpM2qfrSneRRycQRTxicvo4sE="
								"12": "rq+cAEgPoKt10SkVys93lrTjONS0GrYRUb1pMrdEas0="
								"14": "7muu99nPV05CWFoCGQPcD5OSiDaM7pRprT7eDZTvkBM="
							}
							multi_step: {
								hash:       "C294BC0IP63HU6BVO8QG2LTR1GA81O9A8FET4V4F9TV50NS820KG===="
								scriptHash: "JDMFCRKCVQU5H71EDL64A02NTJMOLU86EKO0PU80IOJJD6S24T6G===="
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
									cmd:      "cue vet ./internal/ci/github"
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
