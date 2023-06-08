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
	"bytes"
	"context"
	"errors"
	"fmt"
	"io"
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
	const checkInterval = time.Second
	deadline, ok := t.Deadline()
	if !ok {
		// The test does not have a timeout. Define a reasonable deadline based
		// on the default test timeout, nothing else. This entire test should
		// take nothing like that length of time, but in the interests of
		// consistency with _something_, using 10m is
		deadline = time.Now().Add(10 * time.Minute)
	}
	// Subtract an amount of time equal to twice the checkInterval to
	// allow us to fail before the test binary is itself failed
	deadline = deadline.Add(-2 * checkInterval)

	ctx, done := context.WithDeadline(context.Background(), deadline)
	wg, ctx := errgroup.WithContext(ctx)

	var buf bytes.Buffer

	// Run serve.bash as if a user would, with the exception that this will not
	// run interactively. Because the script is not running interactively, bash
	// ignores SIGINT (see man bash). The effect is that whilst script is
	// running and until the runPreprocessor.bash script (called by serve.bash)
	// itself runs "exec preprocessor" then the interupt triggered by the
	// interrupt signal on Cancel will not work. The result of "missing" this
	// interrupt would be that the serve process running forever. However,
	// because we have now increased the on this test, the likelihood of us
	// still being in the phase pre exec of preprocessor when a test timeout
	// happens (a timeout that should trigger an interrupt of the serve process)
	// is almost zero, unless the caller deliberately sets a significantly lower
	// test timeout.
	cmd := exec.CommandContext(ctx, "./_scripts/serve.bash", "--debug=all")
	cmd.Cancel = func() error {
		return cmd.Process.Signal(os.Interrupt)
	}
	cmd.Stdout = &buf
	cmd.Stderr = &buf
	cwd, _ := os.Getwd()
	cmd.Dir = filepath.Join(cwd, "..", "..", "..")

	// Run serve
	wg.Go(func() error {
		if err := cmd.Start(); err != nil {
			return fmt.Errorf("serve failed to start: %v", err)
		}
		if err := cmd.Wait(); err != nil && !errors.Is(err, context.Canceled) {
			return fmt.Errorf("serve failed to wait for command: %v\n%s", err, buf.Bytes())
		}
		return nil
	})

	// Run check
	wg.Go(func() error {
		defer done()
		tick := time.NewTicker(time.Second)
		for {
			if ok && time.Until(deadline) < 2*time.Second {
				return fmt.Errorf("timed out trying to fetch")
			}
			select {
			case <-tick.C:
				resp, err := http.Get("http://127.0.0.1:1313/docs/")
				if err != nil {
					// Server not ready yet.
					continue
				}
				// server is up and running
				defer resp.Body.Close()
				body, err := io.ReadAll(resp.Body)
				if err != nil {
					return fmt.Errorf("failed to read response body: %v", err)
				}
				if !bytes.Contains(body, []byte("Welcome to CUE")) {
					return fmt.Errorf("body did not contain expected value:\n%s", body)
				}
				tick.Stop()
				return nil
			case <-ctx.Done():
				// The serve command failed/other before we successfully
				// GET-ed the page.
				return nil
			}
		}
	})

	if err := wg.Wait(); err != nil {
		t.Fatalf("failed: %v", err)
	}
}
