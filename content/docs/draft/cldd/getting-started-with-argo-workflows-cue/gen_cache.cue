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
									"1":  "RX7LroNKzAJYSE5UytgV1Nu42Kbe0QdtYrQjU/KoZDk="
									yaml: "dYUE5PqzJLeoIKCuopfXpTcu9dyeTHWyn8nomFwTTaQ="
								}
								multi_step: {
									hash:       "GQEHC83IO26AKL1H402T83DUECGDCID5VAFBIPQICVL8SM1BJAB0===="
									scriptHash: "M8DKEQIOOOS2VLLNA0E99I7TEFIGNE37634F5ENMLEOI77LRTRCG===="
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
										cmd:      "mkdir -p .github/workflows/"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue export --outfile .github/workflows/workflow.yml -e workflow.example"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "mv .github/workflows/workflow.yml{,.got}"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "diff --side .github/workflows/workflow.yml{,.got}"
										exitCode: 0
										output: """
												name: learn-github-actions\t\t\t\t\tname: learn-github-actions
												run-name: ${{ github.actor }} is learning GitHub Actions\trun-name: ${{ github.actor }} is learning GitHub Actions
												"on":\t\t\t\t\t\t\t\t"on":
												  - push\t\t\t\t\t\t\t  - push
												jobs:\t\t\t\t\t\t\t\tjobs:
												  check-bats-version:\t\t\t\t\t\t  check-bats-version:
												    runs-on: ubuntu-latest\t\t\t\t\t    runs-on: ubuntu-latest
												    steps:\t\t\t\t\t\t\t    steps:
												      - uses: actions/checkout@v4\t\t\t\t      - uses: actions/checkout@v4
												      - uses: actions/setup-node@v4\t\t\t\t      - uses: actions/setup-node@v4
												        with:\t\t\t\t\t\t\t        with:
												          node-version: "20"\t\t\t\t\t          node-version: "20"
												      - run: npm install -g bats\t\t\t\t      - run: npm install -g bats
												      - run: bats -v\t\t\t\t\t\t      - run: bats -v

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
