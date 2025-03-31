package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"getting-started-with-gitlab-cicd-cue": {
						page: {
							cache: {
								upload: {
									"1":  "CIc7qKnrNDhu3uW69DwSFP/whz8aMYFYs3n5jeEVIrA="
									yaml: "/jgs0j94bl/P7UBOGVaN/9AxaQeTs50jPUsSOUqt1uk="
								}
								multi_step: {
									hash:       "EQT8LOT0AFEKLTJHHIDDBU67BQNGLCTNB9M2Q2JLV2EHEFIO9E70===="
									scriptHash: "8AVBEJ849JSNO0TIUAKKR7498LSPPOMFP5RQLLHH5BM2C6508B8G===="
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
										cmd:      "export PATH=/cues/v0.13.0-alpha.2:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      "#ellipsis 1"
										cmd:      "cue version"
										exitCode: 0
										output: """
												cue version v0.13.0-alpha.2
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
										cmd:      "cue export --outfile .gitlab-ci.yml -e pipelines.example"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "mv .gitlab-ci.yml{,.got}"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "diff -u .gitlab-ci.yml{,.got}"
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
