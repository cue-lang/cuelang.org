package site
{
	content: {
		docs: {
			draft: {
				"cbe-005_gitlab_ci": {
					page: {
						cache: {
							upload: {
								"4":  "a/38lYrqGap8Utd1s1Lhn90To2kDRLJZSwtFGSbDL24="
								"5":  "+4EE218FSZDv0qsMU5EgWlnaYjKPQ1kOYL0MTmg5IYI="
								"10": "TsAomDqkxsjC5CXe3/kKn9lKFhuRv6AAhlf8PE72tvw="
								"11": "x+NRZoOaYQhWzNPUtuBDYxF059+1WCBiXVaEDrl6ge0="
								"12": "2NXVg3M94MzFdZgfa06RxCky25vzi8srX6flwXF/PMU="
								"14": "OL9RAMC5JyJCxboxVSTWZVFOXtDQjA394qqLGzqjIME="
							}
							multi_step: {
								hash:       "VR9SC22BOUL84OVJJS2OA404ABQH2PU785BP3VEF4UIHQSMNATJ0===="
								scriptHash: "9VUEU5QED1V0HDUKHBI0IOI7JGGAKGTP62MMF3EFVT1RUQ2QJIVG===="
								steps: [{
									doc: """
											# Required because v0.10.0 suffers from https://cuelang.org/issue/3462, which
											# is fixed in v0.11.0-alpha.2 and later.
											"""
									cmd:      "export PATH=/cues/v0.11.0-alpha.3:$PATH"
									exitCode: 0
									output:   ""
								}, {
									doc:      "# Set up example content as a git repo."
									cmd:      "cd Flockademic"
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "git init ."
									exitCode: 0
									output: """
											...

											"""
								}, {
									doc:      ""
									cmd:      "git config user.email cuelang.org@cue.example"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "git config user.name cuelang.org"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "git add . -v"
									exitCode: 0
									output: """
											add '.gitlab-ci.yml'

											"""
								}, {
									doc:      ""
									cmd:      "git commit -m \"Initial commit\" >/dev/null"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cd .."
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cd Flockademic # our example repository"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "git status # should report \"working tree clean\""
									exitCode: 0
									output: """
											On branch master
											nothing to commit, working tree clean

											"""
								}, {
									doc:      ""
									cmd:      "cue mod init gitlab.com/flockademic/flockademic"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue import .gitlab-ci.yml --with-context -p gitlab -f -l pipelines: -l 'strings.TrimSuffix(path.Base(filename),path.Ext(filename))' -o gitlab-ci.cue"
									exitCode: 0
									output:   ""
								}, {
									doc: """
											# Actual command in CUE-By-Example guide:
											# ls {,.}*gitlab-ci*
											"""
									cmd:      "ls {,.}*gitlab-ci* >../4.expected.txt"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff ../4.expected.txt ../4.actual.txt"
									exitCode: 0
									output:   ""
								}, {
									doc: """
											# Actual command in CUE-By-Example guide:
											# head -9 gitlab-ci.cue
											"""
									cmd:      "head -9 gitlab-ci.cue >../5.actual.txt"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff --side ../5.expected.txt ../5.actual.txt"
									exitCode: 0
									output: """
											package gitlab\t\t\t\t\t\t\tpackage gitlab

											pipelines: ".gitlab-ci": {\t\t\t\t\tpipelines: ".gitlab-ci": {
											\timage: "node:8.10"\t\t\t\t\t\timage: "node:8.10"
											\tstages: [\t\t\t\t\t\t\tstages: [
											\t\t"prepare",\t\t\t\t\t\t\t"prepare",
											\t\t"test",\t\t\t\t\t\t\t\t"test",
											\t\t"build-backend",\t\t\t\t\t\t"build-backend",
											\t\t"deploy-backend",\t\t\t\t\t\t"deploy-backend",

											"""
								}, {
									doc:      ""
									cmd:      "mkdir -p internal/ci/gitlab"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "mv gitlab-ci.cue internal/ci/gitlab"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "curl -sSo internal/ci/gitlab/gitlab.cicd.pipeline.schema.json https://gitlab.com/gitlab-org/gitlab/-/raw/7aa6170c4c81a98f372d7c52f3918858c4b69cca/app/assets/javascripts/editor/schema/ci.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue import jsonschema+strictFeatures=0: internal/ci/gitlab/gitlab.cicd.pipeline.schema.json -p gitlab -l '#Pipeline:'"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cd $(git rev-parse --show-toplevel) # make sure we're sitting at the repository root"
									exitCode: 0
									output:   ""
								}, {
									doc: """
											# Actual command in CUE-By-Example guide:
											# cue help cmd regenerate ./internal/ci/gitlab   # the "./" prefix is required
											"""
									cmd:      "cue help cmd regenerate ./internal/ci/gitlab | head -4 >../12.expected.txt"
									exitCode: 0
									output:   ""
								}, {
									doc: """
											# Sometimes the above command's regeneration of the YAML file doesn't get
											# sync'd to disk before we git-diff it, below. Make sure that it does.
											"""
									cmd:      "sync"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff ../12.expected.txt ../12.actual.txt"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue cmd regenerate ./internal/ci/gitlab # the \"./\" prefix is required"
									exitCode: 0
									output:   ""
								}, {
									doc: """
											# Actual command in CUE-By-Example guide:
											# git diff .gitlab-ci.yml
											# For some unknown reason the trailing '>../...' redirection *only* works when
											# the diff command is given a '--' separator. I'm utterly stumped, but let's
											# just give it what it wants!
											"""
									cmd:      "git diff -- .gitlab-ci.yml | grep -vE '^index [0-9a-f]{7}\\.\\.[0-9a-f]{7}' | head -10 >../14.actual.txt"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff --side ../14.expected.txt ../14.actual.txt"
									exitCode: 0
									output: """
											diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml\t\t\tdiff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
											--- a/.gitlab-ci.yml\t\t\t\t\t\t--- a/.gitlab-ci.yml
											+++ b/.gitlab-ci.yml\t\t\t\t\t\t+++ b/.gitlab-ci.yml
											@@ -1,5 +1,6 @@\t\t\t\t\t\t\t@@ -1,5 +1,6 @@
											-image: node:8.10\t\t\t\t\t\t-image: node:8.10
											+# Code generated by internal/ci/gitlab/ci_tool.cue; DO NOT E\t+# Code generated by internal/ci/gitlab/ci_tool.cue; DO NOT E
											 \t\t\t\t\t\t\t\t 
											+image: node:8.10\t\t\t\t\t\t+image: node:8.10
											 stages:\t\t\t\t\t\t\t stages:
											   - prepare\t\t\t\t\t\t\t   - prepare

											"""
								}, {
									doc:      ""
									cmd:      "git add .gitlab-ci.yml internal/ci/gitlab/ cue.mod/module.cue"
									exitCode: 0
									output:   ""
								}, {
									doc: """
											# Actual command in CUE-By-Example guide:
											# git commit -m "ci: create CUE sources for GitLab CI/CD pipelines"
											"""
									cmd:      "git commit --quiet -m \"ci: create CUE sources for GitLab CI/CD pipelines\""
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
