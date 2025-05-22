package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"getting-started-with-kubernetes-cue": {
						page: {
							cache: {
								upload: {
									"1":  "NwxMjSDRLn+uzUt+2vFmGLOiw1cTNQ8Oi+NNYZNexBc="
									yaml: "sYwve9yWXi5bs28ncJ/wkcHNK9meOAHZLBdKZi3vqSM="
								}
								multi_step: {
									hash:       "P0AJV3QPBTKOQCT8VUK88HL0STA5TLDTKV81HADSBUN7AISIV3NG===="
									scriptHash: "6SCUV4VMF5B4A0JTDNEEH425IS8BO8UKJPLUO863UEN8IUGPHDVG===="
									steps: [{
										doc:      ""
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
										cmd:      "export PATH=/cues/v0.13.0:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      "#ellipsis 1"
										cmd:      "cue version"
										exitCode: 0
										output: """
												cue version v0.13.0
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
										cmd:      "cue export --outfile manifest.yml"
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
