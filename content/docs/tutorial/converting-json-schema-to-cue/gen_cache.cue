package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "qFTyivG2pr05LAFmaliVc3gOFA786JhHBQiDc8+wMpA="
								"schema.cue":         "G56W/26EzQBBeP4+9yQc7UdSU002B6lzO5MfbNvDUwI="
								"split_pea.yml":      "9MaGwX7KpSdPNmr4viGHlPdxt6Iqy82CWgyow3/NTnQ="
								"pomodoro.yml":       "EiA2F2DmvQ+84ZQxNTQ9DyEnhB1KyXxPn0fILzplQTg="
								"pomodoro.yml fixed": "ZipEhnWjYHY9H6w227vixCm7Hmm+EazLayNey9UwGPU="
							}
							multi_step: {
								hash:       "UL5AU8OOPHPKUC8LQ9AFH2PGF34D1BB1C30P6DRFK2PFBHH941E0===="
								scriptHash: "EEKUOTTD6EPHLI57C8VDPJM17PGNAHR4LE3VPVJK8JJJ1NVQDBEG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.12.0
											...

											"""
								}, {
									doc:      ""
									cmd:      "cue import -l '#restaurant:' -p cuisine schema.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cp schema.cue .schema.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff -u .schema.cue schema.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -d '#restaurant' schema.cue *.yml"
									exitCode: 1
									output: """
											tables.0.seats: invalid value 100 (out of bound <=10):
											    ./schema.cue:13:17
											    ./pomodoro.yml:4:12

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -d '#restaurant' schema.cue *.yml"
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
