package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"getting-started-with-buildkite-cue": {
						page: {
							cache: {
								upload: {
									"1":  "FuJlcTTfGyMgmuLjtc92thGwyghU5uKp8sdssCr/65c="
									yaml: "YzjYXdB5MXUKgqpnus7Q0nG2z313rvyrkEOg0bvjc8I="
								}
								multi_step: {
									hash:       "BE430LP9QR8EQSAOGD1SVASSQMOUVEN5NHK76PBSGJKG1LRJCC5G===="
									scriptHash: "O1D1R89BE9E064MAQALDRD0D54C7ND39D1OJ0NB0UJMQR69989JG===="
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
										cmd:      "mkdir .buildkite"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue export --outfile .buildkite/pipeline.yml -e pipelines.example"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "mv .buildkite/pipeline.yml{,.got}"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "diff -u .buildkite/pipeline.yml{,.got}"
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
