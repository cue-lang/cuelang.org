// Copyright 2023 The CUE Authors
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package main

import (
	"context"
	"errors"
	"fmt"
	"net/http"
	"os"
	"os/exec"
	"path/filepath"
	"testing"
	"time"

	"golang.org/x/sync/errgroup"
)

// Ensure that we can run the default serve script to render the homepage
func TestServeScript(t *testing.T) {
	ctx, done := context.WithCancel(context.Background())
	wg, ctx := errgroup.WithContext(ctx)

	cwd, _ := os.Getwd()
	cmd := exec.CommandContext(ctx, "./_scripts/serve.bash")
	cmd.Cancel = func() error {
		return cmd.Process.Signal(os.Interrupt)
	}
	cmd.Dir = filepath.Join(cwd, "..", "..", "..")

	// Run serve
	wg.Go(func() error {
		out, err := cmd.CombinedOutput()
		if err != nil && !errors.Is(err, context.Canceled) {
			return fmt.Errorf("serve failed: %v\n%s", err, out)
		}
		return nil
	})

	// Run check
	wg.Go(func() error {
		var i int
		for {
			i++
			if i == 10 {
				return fmt.Errorf("timed out trying to fetch")
			}
			time.Sleep(time.Second)
			_, err := http.Get("http://localhost:1313")
			if err == nil {
				// server is up and running
				break
			}
		}
		done()
		return nil
	})

	if err := wg.Wait(); err != nil {
		t.Fatal(err)
	}
}
