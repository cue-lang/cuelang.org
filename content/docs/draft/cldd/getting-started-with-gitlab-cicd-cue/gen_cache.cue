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
									"1":  "rYtrl3rvrbbN918lE2gpcSLAB+dhns5GG4JGCjm2NRA="
									yaml: "ZuTZ8KWVuJsd3FGysO0yFpQMTJS8Ed6D45PxlF2o5Ss="
								}
								multi_step: {
									hash:       "0CFUPO0HG8ATS3I8B3NK2I7HG8FUT7LHBHPT7CA020RDFN64ENA0===="
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
