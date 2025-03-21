package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"getting-started-with-azure-pipelines-cue": {
						page: {
							cache: {
								upload: {
									"1":  "eDurBQLVmqEL09Gl5qieveRxupDNeALA8bla4PeT0dU="
									yaml: "L73tro29IPqxzysZ8JPVy5NZwWcZW32TeMYTiahP2E4="
								}
								multi_step: {
									hash:       "R9GED623D97BE5G9ADNHFBLFAGJDG04EHT1ADKOJG2CVCSMTTM8G===="
									scriptHash: "TIE2DEUTUJIP0MLPBD0PQ8QHMKIPDUSP2RC0SADPMQ29U952Q0J0===="
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
										cmd:      "export PATH=/cues/v0.13.0-alpha.1.0.20250321144843-86e62b281609:$PATH"
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
										doc:      ""
										cmd:      "cue mod init cue.example"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue mod tidy"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue vet -c"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue export --outfile pipeline.yml -e pipelines.example"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "mv pipeline.yml{,.got}"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "diff -u pipeline.yml{,.got}"
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
