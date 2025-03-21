package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"checking-existing-github-actions-files": {
						page: {
							cache: {
								upload: {
									"known-good workflow content": "JKMwZlrEDAaSzi4f7ymdO+0XkZkG1VB8zzIbCSaI1VI="
								}
								multi_step: {
									hash:       "RRVRCVAN4SVN10EEA30SO2B5578QFKLLO5ALHC17D6V4C7KKJLA0===="
									scriptHash: "NJIMOQ7KVOTH9V4LQP5T2TUQESBV03T4SVSJOJ0F40QIRIN8RP90===="
									steps: [{
										doc:      "# Registry auth"
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
										doc: """
												# Switch to CUE tip, as this page will only be seen on tip.cuelang.org
												# and it's easiest to align behaviours here, inline, rather than using
												# the internal/patch/tip.diff mechanism.
												"""
										cmd:      "export PATH=/cues/v0.13.0-alpha.1.0.20250324111431-1eccc4649d73:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc: """
												# Use evalv3, as that's required for curated modules.
												# TODO(jm): remove this after the site's cmd/cue tip version reaches a version
												# which has evalv3 enabled by default.
												"""
										cmd:      "export CUE_EXPERIMENT=evalv3=1"
										exitCode: 0
										output:   ""
									}, {
										doc: """
												#We choose to perform this fetch (instead of faking it with #norun) to ensure
												#that the remote file is still live and we're not pointing to a dead URL.
												#We perform the fetch instead of embedding & displaying the file inline as that
												#would lengthen what can otherwise be a powerfully short and succinct guide.
												"""
										cmd:      "curl -sl -o workflow.yml https://raw.githubusercontent.com/actions/starter-workflows/a413869948c7f5d5610b00346997272c4ba33f84/ci/go.yml"
										exitCode: 0
										output:   ""
									}, {
										doc:      "# Given we're fetching a static file, we can verify its contents against the known-good file."
										cmd:      "diff -u workflow{.want,}.yml"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue vet -c github.com/cue-tmp/jsonschema-pub/exp3/githubactions@latest workflow.yml -d '#Workflow'"
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
}
