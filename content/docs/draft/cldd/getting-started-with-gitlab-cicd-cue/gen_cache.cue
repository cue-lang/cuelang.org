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
									"1":  "1QSSZdMCiE5+XpmLtq4o+r+Nf+CLfp2uQwS4t9I6i/g="
									yaml: "owONXb+ao391zdGnQ84dVYQTTMsCy08UruhPUaNKtlU="
								}
								multi_step: {
									hash:       "1ON44CKILVKTCVIPU3T7GJI10P5OTU1IC5FTNBICT6CM8GE72I1G===="
									scriptHash: "NGJIRA756GBUHVLBRS53HPJHO51LG0GV9LC5RPUJ7NDQI02PCKIG===="
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
