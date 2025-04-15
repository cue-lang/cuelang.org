package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"drying-up-github-actions-workflows": {
						page: {
							cache: {
								upload: {
									"test.cue pre":     "+kKoQCsBFvdKqFtKtan8OnSMpZvDO/81nn2F2aSUygE="
									"release.cue pre":  "FVNHm3uWCk9mOVwvzk3TgvS7f4V5XJp+nTbTKMnrBeg="
									"test.cue post":    "01j8jrFSmLHbhNhNiRngPEnOeCkzNDkLQ8nE0SW8nD4="
									"release.cue post": "3Dx73mZODQrCY8bJqup+utJFfYp3XqKYfmVol6RsHmg="
								}
								multi_step: {
									hash:       "V480VHUNH0V16QHC7GB353SE24A75668HSA5HNU5TIOOUEOJB8DG===="
									scriptHash: "5E6IAFL04PLUEML5NKBF2H0O91U32JM8SG5C422VDMIJ34UQ6J2G===="
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
										cmd:      "export PATH=/cues/v0.13.0-alpha.4:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      "#ellipsis 1"
										cmd:      "cue version"
										exitCode: 0
										output: """
												cue version v0.13.0-alpha.4
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
										cmd:      "cue export ./ci/github --out yaml"
										exitCode: 0
										output: """
												workflows:
												  release:
												    name: Release
												    "on":
												      push:
												        tags:
												          - v*
												    jobs:
												      build:
												        runs-on: ubuntu-latest
												        steps:
												          - uses: actions/checkout@v4
												          - name: Set up Go
												            uses: actions/setup-go@v5
												            with:
												              go-version: "1.24"
												          - name: Install dependencies
												            run: go mod tidy
												          - name: Vet
												            run: go vet -v ./...
												          - name: Test
												            run: go test -v -race ./...
												          - name: Build
												            run: go build -v -x ./...
												          - name: Release
												            run: echo Actually follow the project's release process here ...
												    permissions:
												      contents: read
												  test:
												    name: Test PRs
												    "on":
												      pull_request:
												        branches:
												          - main
												    jobs:
												      buildAndTest:
												        runs-on: ubuntu-latest
												        steps:
												          - uses: actions/checkout@v4
												          - name: Set up Go
												            uses: actions/setup-go@v5
												            with:
												              go-version: "1.24"
												          - name: Install dependencies
												            run: go mod tidy
												          - name: Vet
												            run: go vet -v ./...
												          - name: Test
												            run: go test -v ./...
												          - name: Build
												            run: go build -v -x ./...
												    permissions:
												      contents: read
												      pull-requests: read

												"""
									}, {
										doc:      ""
										cmd:      "cue export ./ci/github | md5sum"
										exitCode: 0
										output: """
												789a1b8a6f557c97a654a373d24f40b8  -

												"""
									}, {
										doc:      ""
										cmd:      "cue export ./ci/github --out yaml"
										exitCode: 0
										output: """
												workflows:
												  release:
												    name: Release
												    "on":
												      push:
												        tags:
												          - v*
												    jobs:
												      release:
												        runs-on: ubuntu-latest
												        steps:
												          - uses: actions/checkout@v4
												          - name: Set up Go
												            uses: actions/setup-go@v5
												            with:
												              go-version: "1.24"
												          - name: Install dependencies
												            run: go mod tidy
												          - name: Vet
												            run: go vet -v  ./...
												          - name: Test
												            run: go test -v -race ./...
												          - name: Build
												            run: go build -v -x ./...
												          - name: Release
												            run: echo Actually follow the project's release process here ...
												    permissions:
												      contents: read
												  test:
												    jobs:
												      buildAndTest:
												        steps:
												          - uses: actions/checkout@v4
												          - name: Set up Go
												            uses: actions/setup-go@v5
												            with:
												              go-version: "1.24"
												          - name: Install dependencies
												            run: go mod tidy
												          - name: Vet
												            run: go vet -v  ./...
												          - name: Test
												            run: go test -v  ./...
												          - name: Build
												            run: go build -v -x ./...
												        runs-on: ubuntu-latest
												    name: Test PRs
												    "on":
												      pull_request:
												        branches:
												          - main
												    permissions:
												      pull-requests: read
												      contents: read

												"""
									}, {
										doc:      ""
										cmd:      "cue export ./ci/github | md5sum"
										exitCode: 0
										output: """
												c742188f173f1ecd926d23dbecd16e79  -

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
}
