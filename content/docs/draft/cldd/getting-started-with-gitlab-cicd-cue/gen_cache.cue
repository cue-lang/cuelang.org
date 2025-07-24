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
									"1":  "m0OucHgqgbMonWZcHfv/ZKY3kdxqEn7cUEL3a2ssf/U="
									yaml: "eX3DoPd+9Qc7/xA9FmuZLDxfAW8rDz9+w/Xs3aisX+4="
								}
								multi_step: {
									hash:       "AIOH8VJ1DEKBNPP5E07733E9LFRE5VK0IJDIMRUO0DIBK3BT7ANG===="
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
