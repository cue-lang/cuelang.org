package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"getting-started-with-github-actions-cue": {
						page: {
							cache: {
								upload: {
									"1":  "q/lHVXREAppiZAx4vjl0PEHzAgr7RBdHi1HebT+F/IA="
									yaml: "Kscn1tBOMIkMWFFo14Ja/28Jmuf8VQTetxghwMIRsAs="
								}
								multi_step: {
									hash:       "1FPCVMORRHQF0BUSKO8V1POVLKPK381IIAS60EANDODAJ908LP9G===="
									scriptHash: "CVV8HD6S1O95UKGIJMC280FGUFEKB8BESVSBGNVT1A4TG0QUE540===="
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
										doc:      "# TODO(jm): revert to latest when it has evalv3 as default."
										cmd:      "export PATH=/cues/v0.13.0-alpha.3.0.20250411164907-08c3542c9d96:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      "#ellipsis 1"
										cmd:      "cue version"
										exitCode: 0
										output: """
												cue version v0.13.0-alpha.3.0.20250411164907-08c3542c9d96
												...

												"""
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
										cmd:      "mkdir -p .github/workflows/"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue export --outfile .github/workflows/workflow.yml -e workflows.example"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "mv .github/workflows/workflow.yml{,.got}"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "diff -u .github/workflows/workflow.yml{,.got}"
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
