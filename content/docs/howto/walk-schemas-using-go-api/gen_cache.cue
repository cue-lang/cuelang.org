package site
{
	content: {
		docs: {
			howto: {
				"walk-schemas-using-go-api": {
					page: {
						cache: {
							upload: {
								schema:       "ZiTCZ2zjFhWeocP2xNTcVIIK4v6oAxeeuswEY6fOxio="
								"go program": "U/eee5z0yhf9VTFadYix0lO3xl5hCjwutzeP7RdCzZk="
							}
							multi_step: {
								hash:       "NTJCRMJ00JCFU9U6CB7BUHP9499FSHO2O7R0IMSJRQSELDG7EPI0===="
								scriptHash: "0V9329U6JVQMJFTC4RFAI48B459TIPL445BJCSO1HTFQOANCMOCG===="
								steps: [{
									doc:      ""
									cmd:      "export GOMODCACHE=/caches/gomodcache"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "export GOCACHE=/caches/gobuild"
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go mod init go.example"
									exitCode: 0
									output: """
											...

											"""
								}, {
									doc:      ""
									cmd:      "cue mod init cue.example"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet"
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go get cuelang.org/go@v0.12.0"
									exitCode: 0
									output: """
											...

											"""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go mod tidy"
									exitCode: 0
									output: """
											...

											"""
								}, {
									doc:      ""
									cmd:      "go run ."
									exitCode: 0
									output: """
											package p

											type Person struct {
											\tname string
											\tage int
											}
											type Address struct {
											\tline1 string
											\tline2 string
											\tline3 string
											\tcountry string
											}

											"""
								}, {
									doc:      ""
									cmd:      "go vet ./..."
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go run honnef.co/go/tools/cmd/staticcheck@v0.6.0 ./..."
									exitCode: 0
									output: """
											...

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
