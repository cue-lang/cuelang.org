package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"spotting-errors-earlier-goreleaser-files": {
						page: {
							cache: {
								upload: {
									broken: "4Y3HYeb4/CH3urOz2yfNNg0LAJ8sv5NSniILuHI0E8Y="
									fixed:  "XHoBY+H10rs7kl3dOxuR2pxYs/IfwoFI6STk42hbrCI="
								}
								multi_step: {
									hash:       "PAP4IRVIKP44LH7S145C256HMIJQ2MHAR638SAFG3M8AMRKILK4G===="
									scriptHash: "Q4IEVKNFID82HN75T2MB6FMP25IGGSEI0AJKTESJNIG8F2A0TE20===="
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
										cmd:      "cue vet -c -d '#Project' cue.dev/x/goreleaser@latest .goreleaser.yml"
										exitCode: 1
										output: """
												docker: field not allowed:
												    .goreleaser.yml:7:1

												"""
									}, {
										doc:      ""
										cmd:      "cue vet -c -d '#Project' cue.dev/x/goreleaser@latest .goreleaser.yml"
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
