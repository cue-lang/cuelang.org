package site
{
	content: {
		docs: {
			draft: {
				"cbe-001_github_actions_importing_workflows": {
					page: {
						cache: {
							upload: {
								"4":  "dy7ck8LmOgo6yBrhApLbR/qXxY7tYcy3kJboajuOWPk="
								"5":  "SQ+cR2ILiVmOUEvYDgsLG913+n8kOe4J5iS0IpkfJNw="
								"10": "7o6ROqQLvofqQ45F3G7NHm4Ux8S+3xJAWMAbwVEMUt4="
								"11": "NBCZyGtWI9CTWrSa2pKocRAk5wxUaD0LwR0PyQ6HDxg="
								"12": "l+xMiV8UXbwLDte1MKLZR8j25d1goVCBjIkRqRi6hFQ="
								"14": "S0r+eS2cDHgS2BPuhHfL7DA8fN/8CI55B8OTOjzBTSU="
							}
							multi_step: {
								hash:       "ME18DQBAT3RM5V97KPHSNPJO8FHJ8H3CJURIRJIA3O879DH5HPHG===="
								scriptHash: "2ROG99MNSP5JKTO335N9PIQN9OL1V49TUR25BTDD0AMDUQKHQNT0===="
								steps: [{
									doc:      ""
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
									doc:      ""
									cmd:      "ls .github/workflows/ >../4.actual.txt"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff ../4.actual.txt ../4.expected.txt"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
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
									cmd:      "curl -o internal/ci/github/github.actions.workflow.schema.json https://raw.githubusercontent.com/SchemaStore/schemastore/f728a2d857a938979f09b0a7f014fbe0bc1898ee/src/schemas/json/github-workflow.json"
									exitCode: 0
									output: """
											  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
											                                 Dload  Upload   Total   Spent    Left  Speed
											\r  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0\r100 95430  100 95430    0     0  1010k      0 --:--:-- --:--:-- --:--:-- 1012k

											"""
								}, {
									doc:      ""
									cmd:      "cue import -f -l '#Workflow:' -p github internal/ci/github/github.actions.workflow.schema.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cd $(git rev-parse --show-toplevel) # make sure we're sitting at the repository root"
									exitCode: 0
									output:   ""
								}, {
									doc:      "# Fails because of https://cuelang.org/issue/3462; will be fixed with CUE v0.11.0."
									cmd:      "cue help cmd regenerate ./internal/ci/github # the \"./\" prefix is required"
									exitCode: 1
									output: """
											Unknown cmd command: regenerate
											Usage:
											  cue cmd regenerate [flags]

											Global Flags:
											  -E, --all-errors   print all available errors
											  -i, --ignore       proceed in the presence of errors
											  -s, --simplify     simplify output
											      --strict       report errors for lossy mappings
											      --trace        trace computation
											  -v, --verbose      print information about progress

											"""
								}, {
									doc:      "# Temporary workaround for cuelang.org testing only."
									cmd:      "cd internal/ci/github"
									exitCode: 0
									output:   ""
								}, {
									doc:      "# FIXME: why is this failing, even after we chdir?"
									cmd:      "cue help cmd regenerate | head -4 >../../../../12.actual.txt"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cd ../../.."
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cat ../12.expected.txt"
									exitCode: 0
									output: """
											Regenerate all workflow files

											Usage:
											  cue cmd regenerate [flags]

											"""
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
									doc:      ""
									cmd:      "git diff .github/workflows/ | grep -v '^index [0-9a-f]{7}\\.\\.[0-9a-f]{7}' >../14.actual.txt"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "git add .github/workflows/ internal/ci/github/ cue.mod/module.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "git commit -m \"ci: create CUE sources for GHA workflows\""
									exitCode: 0
									output: """
											[master b4b4d68] ci: create CUE sources for GHA workflows
											 9 files changed, 2777 insertions(+)
											 create mode 100644 cue.mod/module.cue
											 create mode 100644 internal/ci/github/ci_tool.cue
											 create mode 100644 internal/ci/github/github.actions.workflow.schema.cue
											 create mode 100644 internal/ci/github/github.actions.workflow.schema.json
											 create mode 100644 internal/ci/github/workflow1.cue
											 create mode 100644 internal/ci/github/workflow2.cue
											 create mode 100644 internal/ci/github/workflows.cue

											"""
								}]
							}
						}
					}
				}
			}
		}
	}
}
