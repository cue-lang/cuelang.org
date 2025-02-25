package site
{
	content: {
		docs: {
			tutorial: {
				"cfgmgmtcamp-2025": {
					page: {
						cache: {
							upload: {
								"docker-compose.yml broken":          "F7eWmcknEin8LenmqRGJBMkaT4qQxpvf+0RtOiCcKV8="
								schema:                               "mSInjdv3EjXXtwXCdimN/Pixv3X1NSi0bPbfHkcov/I="
								"docker-compose.yaml fixed":          "xAZcH0AecOtKo6S0BG459CCF3E0AHkpDjIMNdToff70="
								"moreschema.cue":                     "fGgBtgbUIXfcE5KuwuJz7ERlhgU5ZftDjVppbSaDfFg="
								"docker-compose.yaml really fixed":   "E8YBVqAJq9/IbhN3hr1ZpRB2dNNdyKK+4KrWMg3qRPs="
								"link splotpolicy and splotservice1": "Zl6K1qh130sbjG62BOceqdZtBx7fR9lqkePmh88JS4c="
							}
							multi_step: {
								hash:       "00BGMQOD1C8BL4QLFKFCR4IE636N4JKV2NDHQBJ6ADGSI7NOTLN0===="
								scriptHash: "D12V16R59NT153J4V2FJ7OH5UPUH2RV76LC6P16HCPTBGRIORIOG===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=\"/cues/v0.13.0-0.dev.0.20250225142354-26a698fe9ae9:$PATH\""
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
											{"registries":{"registry.cue.works":{"access_token":"${TEST_USER_AUTHN_CUE_USER_NEW}","token_type":"Bearer"}}}
											EOD
											"""
									exitCode: 0
									output:   ""
								}, {
									doc: """
											# TODO: this is inherently racey. But not a problem in practice...
											# for now. When it does become a problem we can solve this properly
											# using a nc-based wait loop or similar.
											"""
									cmd:      "nohup cue mod registry localhost:55443 >/tmp/cue_mod_registry 2>&1 &"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet .:splotpolicy docker-compose.yaml -d '#WebService'"
									exitCode: 1
									output: """
											services: field is required but not present:
											    ./schema.cue:4:2

											"""
								}, {
									doc:      ""
									cmd:      "cue vet .:splotpolicy docker-compose.yaml -d '#WebService'"
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
									cmd:      "cat cue.mod/module.cue"
									exitCode: 0
									output: """
											module: "cue.example"
											language: {
											\tversion: "v0.13.0"
											}
											deps: {
											\t"github.com/cue-tmp/jsonschema-pub/exp2/dockercompose@v0": {
											\t\tv:       "v0.0.1"
											\t\tdefault: true
											\t}
											}

											"""
								}, {
									doc:      ""
									cmd:      "cue vet .:splotpolicy docker-compose.yaml -d '#WebService'"
									exitCode: 1
									output: """
											services.web.volume: field not allowed:
											    ./docker-compose.yaml:6:5

											"""
								}, {
									doc:      ""
									cmd:      "cue vet .:splotpolicy docker-compose.yaml -d '#WebService'"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue mod edit --source self"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue mod rename github.com/cue-examples/splotpolicy"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "export CUE_REGISTRY=github.com/cue-examples=127.0.0.1:55443"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue mod publish v0.0.1"
									exitCode: 0
									output: """
											published github.com/cue-examples/splotpolicy@v0.0.1 to 127.0.0.1:55443/github.com/cue-examples/splotpolicy:v0.0.1

											"""
								}, {
									doc:      ""
									cmd:      "cue import -p splotservice1 -l 'content:' docker-compose.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cat docker-compose.cue"
									exitCode: 0
									output: """
											package splotservice1

											content: services: {
											\tweb: {
											\t\timage: "docker.io/library/nginx:latest"
											\t\tports: ["8080:80"]
											\t\tvolumes: [
											\t\t\t"./html:/usr/share/nginx/html",
											\t\t\t"./config/nginx.conf:/etc/nginx/nginx.conf:ro",
											\t\t]
											\t}
											\tdb: image: "docker.io/library/postgres:16.4"
											}

											"""
								}, {
									doc:      ""
									cmd:      "cue vet .:splotservice1"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "sed -i 's/postgres:16.4/postgres:17/' docker-compose.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet .:splotservice1"
									exitCode: 1
									output: """
											content.services.db.image: 3 errors in empty disjunction:
											content.services.db.image: conflicting values "docker.io/library/postgres:16.4" and "docker.io/library/postgres:17":
											    ./docker-compose.cue:12:13
											    ./schema.cue:10:12
											content.services.db.image: conflicting values "docker.io/library/postgres:16.5" and "docker.io/library/postgres:17":
											    ./docker-compose.cue:12:13
											    ./schema.cue:11:5
											content.services.db.image: conflicting values "docker.io/library/postgres:16.6" and "docker.io/library/postgres:17":
											    ./docker-compose.cue:12:13
											    ./schema.cue:12:5

											"""
								}, {
									doc:      ""
									cmd:      "sed -i 's/postgres:17/postgres:16.4/' docker-compose.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet .:splotservice1"
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
