package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"getting-started-with-goreleaser-cue": {
						page: {
							cache: {
								upload: {
									"1":  "pNr7BpdN+fxf54HZ99PQxAYkNLOeOhdkS2BDZ+MW854="
									yaml: "KWmjDxJQ1FAPYQWwLitUqR493rh4co8WPGyo1I1LkM8="
								}
								multi_step: {
									hash:       "A2G0VCVSAVCQA5EBF4SIQ7R55JLJ9E5CUEOF09TNRQSLNCS3DJLG===="
									scriptHash: "T8HAJ5HHFHPPN5JI9TEFE4S4GCFGVQO7B9PTFO1QD7C9U3EGDI6G===="
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
										cmd:      "export PATH=/cues/v0.13.0-alpha.2:$PATH"
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
										cmd:      "cue export --outfile .goreleaser.yaml -e files.example"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "mv .goreleaser.yaml{,.got}"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "diff -u .goreleaser.yaml{,.got}"
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
