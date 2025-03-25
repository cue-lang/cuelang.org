package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "v6EHPlhI0w1dtadjKVDn9sm1XxGyeVlbpu8U1D6Xq2Y="
								"2": "9/AvxDiiKCQiqEzZ+uwRU1mvAjNBjgUELJEumPQnuGA="
								"3": "Hm+giwck5R0iXFSiy+0V+yuE4XTfP7Ajzd3iekUdPfU="
								"4": "XGEyNTbCPk5WaKI0Z2iMc45MxUKg3W5ikoUPW0iGIH4="
								"5": "zpsUVbSpg7hli5ycCNcHwiz6oPozfUbVlDZkvm8I38Y="
								"6": "k4ltbXjP/ncr/pMe4OjLrKw4o/ar+zzKN8hAw9D7x2s="
							}
							multi_step: {
								hash:       "HDP5LV1COJHJD24QD9P2AT6GTF3HFAL41AJUMECVRPKG2KOJV350===="
								scriptHash: "8T5T0B0K6S3NGIIOLM9255HN4DPN78BO9MK4UGDNESVR2HJLV9MG===="
								steps: [{
									doc: """
											# Actual command in CUE-By-Example guide:
											# cue cmd dump
											"""
									cmd:      "cue cmd dump | head -20 >6.actual.txt"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff 6.expected.txt 6.actual.txt"
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
