package main

import "testing"

func TestVersionToGithubURL(t *testing.T) {
	tcs := []struct {
		in  string
		out string
	}{
		{in: "v0.4.0", out: "v0.4.0"},
		{in: "v0.4.0-rc.1", out: "v0.4.0-rc.1"},
		{in: "v0.0.0-20201118171849-f6a6b3f636fc", out: "f6a6b3f636fc"},
	}
	for _, tc := range tcs {
		got := versionToGitHubPath(tc.in)
		if got != tc.out {
			t.Fatalf("versionToGitHubPath(%q); got %q; want %v", tc.in, got, tc.out)
		}
	}
}
