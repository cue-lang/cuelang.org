package site
{
	content: {
		docs: {
			tutorial: {
				"publishing-modules-to-the-central-registry": {
					page: {
						cache: {
							upload: {
								"schema-v0.0.1": "C1tI1qc5TD7nTWeSGAR/2nreoEyHZ06lHZ9DkQXpqq8="
								"config.cue":    "i+Cuh4NwoVpA5dHX7pjSx+eG5eOsm3MCKKko/ClFbuE="
							}
							multi_step: {
								hash:       "61D1IGAC90OONE9ACJ75K018LHGV8NV6N1CKH20L6EROFLTQ2L20===="
								scriptHash: "GNVC75FNAS4AAS3LB4O3HRNRUU12IVJPS7FE6GL45M40CBL3L7V0===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=\"/cues/prerelease:$PATH\""
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "mkdir -p $HOME/.config/cue"
									exitCode: 0
									output:   ""
								}, {
									doc: ""
									cmd: """
											cat <<EOD >$HOME/.config/cue/logins.json
											{"registries":{"registry.cue.works":{"access_token":"${TEST_USER_AUTHN_CUE_USER_COLLABORATOR_RW}","token_type":"Bearer"}}}
											EOD
											"""
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.9.0-alpha.1
											...

											"""
								}, {
									doc:      ""
									cmd:      "mkdir frostyconfig"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cd frostyconfig"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "export CUE_EXPERIMENT=modules"
									exitCode: 0
									output:   ""
								}, {
									doc:      "# Replace \"cueckoo\" with *your* GitHub username"
									cmd:      "cue mod init github.com/cueckoo/frostyconfig@v0"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue mod tidy"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue mod publish v0.0.1"
									exitCode: 0
									output: """
											published github.com/cueckoo/frostyconfig@v0.0.1

											"""
								}, {
									doc:      ""
									cmd:      "mkdir ../frostyapp"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cd ../frostyapp"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue mod init github.com/cueckoo/frostyapp@v0"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue mod tidy"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cat cue.mod/module.cue"
									exitCode: 0
									output: """
											module: "github.com/cueckoo/frostyapp@v0"
											language: {
											\tversion: "v0.9.0-alpha.1"
											}
											deps: {
											\t"github.com/cueckoo/frostyconfig@v0": {
											\t\tv: "v0.0.1"
											\t}
											}

											"""
								}, {
									doc:      ""
									cmd:      "cue export --out yaml"
									exitCode: 0
									output: """
											config:
											  appName: alpha
											  port: 80
											  features:
											    logging: true

											"""
								}]
							}
						}
					}
				}
			}
		}
	}
}
