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
									"1":  "bEf7oWG00bEtevFRY4eBmzWnANFfcPW7x7VclEHBi+s="
									yaml: "u77p4ufyPABeluKW4wczbU40MRgrCXDMfMDmvpc3Q7Q="
								}
								multi_step: {
									hash:       "3DKFUSTGHS0CSS3LHD86JJG9A7F0K090BQKBP8NM52NBAS3J00MG===="
									scriptHash: "EV475GCD0JS8VDGMEUNNQUJ0L503ODMTMUT182HNPC6FPSFHG2QG===="
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
