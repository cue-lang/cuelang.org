package site
{
	content: {
		docs: {
			draft: {
				"cbe-006_buildkite_importing_pipelines": {
					page: {
						cache: {
							upload: {
								"4":  "SzhZvXT0JSwtCYTlgLdy3/R6MKxTckJym0fOdFg9f54="
								"5":  "pZfKR22qdwq5CC6gMAQjGX32NR1fpMEqeaFbvG/jLdk="
								"8":  "ZGp3R5Ir1HDx+4KHKZ45hYO9YegQQu50mtuUyX0AS7E="
								"9":  "jkKaWAPf3AzBfOKcq4If44g/XGFnck3C7vSOQ9BWpYw="
								"10": "rrRoJa30ijAu6szmFBS9KzranXr3nnxRJSLKgxtB1KA="
								"11": "ybZsK+EybsuEnllwJXXkLQb4WdqUCpNZjKjPDx8zeAs="
								"13": "HazJ+sBsXc5X79ppHpXFmYO8UgJHBjjDkj7SIpN3H98="
							}
							multi_step: {
								hash:       "PJE444DTR6TMMGHUDDJHNKML290Q8CHIPRVJSUNC7DEUOAALBDI0===="
								scriptHash: "CPRVHCMO7UO0M0ACM962V8C9PBNCBO8O5HB9DI6M71MMOV2CQMAG===="
								steps: [{
									doc:      "# Set up example content as a git repo."
									cmd:      "cd dependent-pipeline-example"
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
									cmd:      "git add . -v"
									exitCode: 0
									output: """
											add '.buildkite/pipeline.deploy.yml'
											add '.buildkite/pipeline.yml'
											add 'License.md'
											add 'Readme.md'
											add 'templates/deploy/.buildkite/template.yml'
											add 'templates/test/.buildkite/template.yml'

											"""
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
									cmd:      "cd dependent-pipeline-example # our example repository"
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
									cmd:      "cue mod init github.com/buildkite/dependent-pipeline-example"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue import ./.buildkite/*.yml --with-context -p buildkite -f -l pipelines: -l 'strings.TrimSuffix(path.Base(filename),path.Ext(filename))'"
									exitCode: 0
									output:   ""
								}, {
									doc: """
											# Actual command in CUE-By-Example guide:
											# ls .buildkite/
											"""
									cmd:      "ls .buildkite/ >../4.actual.txt"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff ../4.expected.txt ../4.actual.txt"
									exitCode: 0
									output:   ""
								}, {
									doc: """
											# Actual command in CUE-By-Example guide:
											# head .buildkite/*.cue
											"""
									cmd:      "head .buildkite/*.cue >../5.actual.txt"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff ../5.expected.txt ../5.actual.txt"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "mkdir -p internal/ci/buildkite"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "mv ./.buildkite/*.cue internal/ci/buildkite"
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
											# cue help cmd regenerate ./internal/ci/buildkite   # the "./" prefix is required
											"""
									cmd:      "cue help cmd regenerate ./internal/ci/buildkite | head -4 >../11.actual.txt"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff ../11.expected.txt ../11.actual.txt"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue cmd regenerate ./internal/ci/buildkite # the \"./\" prefix is required"
									exitCode: 0
									output:   ""
								}, {
									doc: """
											# Actual command in CUE-By-Example guide:
											# git diff .buildkite/
											"""
									cmd:      "git diff -- .buildkite/ | grep -vE '^index [0-9a-f]{7}\\.\\.[0-9a-f]{7}' | head -8 >../13.actual.txt"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff ../13.expected.txt ../13.actual.txt"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "git add .buildkite/ internal/ci/buildkite/ cue.mod/module.cue"
									exitCode: 0
									output:   ""
								}, {
									doc: """
											# Actual command in CUE-By-Example guide:
											# git commit -m "ci: create CUE sources for Buildkite pipelines"
											"""
									cmd:      "git commit --quiet -m \"ci: create CUE sources for Buildkite pipelines\""
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
