package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"getting-started-with-argo-workflows-cue": {
						page: {
							cache: {
								upload: {
									"1":  "V5ifCkeDKHUeXKI4k8LacpwlbUqqlFMBU+fI9kjdX0Q="
									yaml: "jHNU963WOvNIe32TV3hVI6E+AoTKSbO0BRXU4WHbOdY="
								}
								multi_step: {
									hash:       "7GR4P07OB1VJKJFCMU41QLRIV0AHB4UPU49C6QSMO2OLFUOU4IJG===="
									scriptHash: "6KVFKPOH94B5H20L7RIES467AMN4U4PVM024VP3PM6CMH7GMLEP0===="
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
										cmd:      "export PATH=/cues/v0.13.0-alpha.3:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      "#ellipsis 1"
										cmd:      "cue version"
										exitCode: 0
										output: """
												cue version v0.13.0-alpha.3
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
										cmd:      "cue export --outfile workflow.yml -e workflows.example"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "mv workflow.yml{,.got}"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "diff -u workflow.yml{,.got}"
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
