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
									"1":  "2NJTpvG6CiPVdAm3otBMmm0dOeA9xMzwLFbiNVhZERk="
									yaml: "he48lEo/CqzjLGV7LhAx7rBjJmV757tudGL1gWs3VfQ="
								}
								multi_step: {
									hash:       "JL4UNDDEHPSV4LII5KVSUHVISF99H2TRARD1F8HINRDMTLG7V3PG===="
									scriptHash: "H0K1E86CD94545JSSE1UNGOHFT7426IEUD4DCBTNVFGV7AUF3PQG===="
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
										cmd:      "export CUE_EXPERIMENT=evalv3=1"
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
