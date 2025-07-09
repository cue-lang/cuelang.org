package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"checking-existing-docker-compose-files": {
						page: {
							cache: {
								upload: {
									file: "LCzR2G0LqPT3OGcMyP9jvTtu0T6RokDzBNx9AAmE90I="
								}
								multi_step: {
									hash:       "22L8UQC7FB4431K6P8Q5PSETKLG39SBT5NLVFUTBOFATJI38RKT0===="
									scriptHash: "7CCP61RQQD0KEGGTL108RIHIHFL33IJ32L9PU7F93TNM4RU7F4K0===="
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
										cmd:      "cue vet -c -d '#Schema' cue.dev/x/dockercompose@latest compose.yml"
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
