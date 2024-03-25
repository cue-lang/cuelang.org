package cmd

import (
	"testing"

	"github.com/go-quicktest/qt"
)

func TestOverlappingVariables(t *testing.T) {
	pc := pageConfig{
		LeftDelim:  "{{{",
		RightDelim: "}}}",
		Vars: map[string]pageVar{
			"CUE":    stringVar("really long value"),
			"BANANA": stringVar("CUE"),
		},
	}
	qt.Assert(t, qt.IsNil(pc.init()))

	src := []byte("this is a really long value talking about CUE")
	got := pc.unexpandReferences(src)
	want := []byte("this is a {{{.CUE}}} talking about {{{.BANANA}}}")
	qt.Assert(t, qt.DeepEquals(got, want))
}
