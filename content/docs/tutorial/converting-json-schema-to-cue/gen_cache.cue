package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "WiJ4R41NS70q/fFUw/Q8croR23wNZ4ZPvgDPJ86Cdjw="
								"schema.cue":         "rEzmHrHjqan+wdPEDnOjrxDyMwW4pFaRUmmG0zhGyqI="
								"split_pea.yml":      "lPgx4dXNBQVdD77N3ZowDNZ8H98dUYKhvZpM/k2MVrE="
								"pomodoro.yml":       "3ZfNsl2H/d0lFMMNPcswtlssl/cnve6NPWd2ZtDNanU="
								"pomodoro.yml fixed": "2J1qkayaK2FJ3V7ZwjZpfC7orjByI1obtZyCna1Mk1A="
							}
							multi_step: {
								hash:       "JOJDB20R1N78J5RTLHOMSQIKOI1G03189OBR5OUCEMQMDH826AH0===="
								scriptHash: "KB4BPO7OCPKI6VF8CNIJN5JS65L6MVIO6TQGTDN6KSP4S2F37JSG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.10.0
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
											    ./schema.cue:10:17
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
