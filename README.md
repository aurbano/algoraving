# algoraving

Live coding music experiments with [TidalCycles](https://tidalcycles.org). Nothing serious, just messing around.

## What's in here

**`says.tidal`** [run in Strudel](https://strudel.cc/#Ly8gTmlscyBGcmFobSAiU2F5cyIg4oCUIDE1MCBCUE0sIENtIGFycGVnZ2lvLCBzcXVhcmUgKyBzaW5lLCByZXZlcmIsIGRvdHRlZCAxLzQgZGVsYXkKc2V0Y3BzKDE1MC82MC80KQoKLy8gU3RyaWN0IGFzY2VuZGluZyBDbSBhcnAsIDIgb2N0YXZlcywgMSBvY3QgZG93biwgOHRoIG5vdGVzCi8vIERpcmVjdCBub3RlIG5hbWVzID0gZXhhY3QgYXNjZW5kaW5nIG9yZGVyLCBubyB2b2ljaW5nIGFsZ29yaXRobSBuZWVkZWQKbGV0IG5vdGVzID0gImMyIGViMiBnMiBjMyBlYjMgZzMgYzQgZWI0IgoKLy8gTEZPIHBlcmlvZCBpbiBjeWNsZXMuIEF0IDE1MGJwbS80LCAxIGN5Y2xlIOKJiCAxLjZzIOKGkiBzbG93KDMyKSDiiYggNTFzCi8vIFVzZSBkaWZmZXJlbnQgcHJpbWVzIGZvciBlYWNoIExGTyBzbyB0aGV5IGRyaWZ0IG91dCBvZiBwaGFzZSBvdmVyIHRpbWUKbGV0IGxmb1N5bnRoICA9IHNsaWRlcigzMiwgNCwgOTYpICAgLy8gZmlsdGVyIHN3ZWVwIHBlcmlvZCAoc3ludGgpCmxldCBsZm9Ob2lzZTEgPSBzbGlkZXIoMzcsIDQsIDk2KSAgIC8vIG5vaXNlIGdhaW4gc3dlZXAgcGVyaW9kCmxldCBsZm9Ob2lzZTIgPSBzbGlkZXIoMTksIDQsIDk2KSAgIC8vIG5vaXNlIGZpbHRlciBzd2VlcCBwZXJpb2QKCi8vIE1haW4gc3ludGg6IHNpbmUgKyBzcXVhcmUsIHNob3J0IHBsdWNrIGRlY2F5LCBzbG93IGZpbHRlciBMRk8KJDogbm90ZShub3RlcykKICAucygic2luZSIpCiAgLmRlY2F5KHNsaWRlcigwLjE4LCAwLjA1LCAwLjYpKQogIC5zdXN0YWluKDApCiAgLmdhaW4oc2xpZGVyKDAuNywgMC4xLCAxKSkKICAubHBmKHNpbmUuc2xvdyhsZm9TeW50aCkucmFuZ2UoMjAwLCBzbGlkZXIoMjQwMCwgNDAwLCA2MDAwKSkpCiAgLnJvb20oc2xpZGVyKDAuNzQxLCAwLCAxKSkKICAucm9vbXNpemUoc2xpZGVyKDcuNywgMCwgMTEpKQogIC5kZWxheShzbGlkZXIoMC4zNTIsIDAsIDEpKQogIC5kZWxheXRpbWUoMC42KQogIC5kZWxheWZlZWRiYWNrKHNsaWRlcigwLjQ1NywgMCwgMC45NSkpCgovLyBXaGl0ZSBub2lzZSBiZWQ6IGdhaW4gYW5kIGxwZiBib3RoIGV2b2x2ZSBzbG93bHkgb24gaW5kZXBlbmRlbnQgY3ljbGVzCiQ6IHMoIndoaXRlIikKICAuc2VnKDMyKQogIC5nYWluKHNpbmUuc2xvdyhsZm9Ob2lzZTEpLnJhbmdlKDAuMDA1LCBzbGlkZXIoMC4wNDUsIDAuMDA1LCAwLjEyKSkpCiAgLmxwZihzaW5lLnNsb3cobGZvTm9pc2UyKS5yYW5nZSgxNTAsIHNsaWRlcigxNjAwLCAzMDAsIDMwMDApKSkKICAucm9vbShzbGlkZXIoMC43NDEsIDAsIDEpKQogIC5yb29tc2l6ZShzbGlkZXIoNy43LCAwLCAxMSkpCg%3D%3D) — a (highly inaccurate and simple) TidalCycles cover/interpretation of Nils Frahm's *Says*. Two layers running at 150 BPM:

1. A sine wave arpeggio climbing a C minor chord (`c eb g`, two octaves), short plucky decay with a slow low-pass filter LFO sweeping over ~51 seconds, plus reverb and a dotted-quarter delay.
2. A quiet white noise bed whose gain and filter cutoff drift on their own independent slow cycles (using prime-numbered periods so they never quite line up).

All the interesting parameters — decay, reverb, delay feedback, filter range — are exposed as `slider()` calls so you can tweak them live without stopping playback.

## Running it

You need [SuperCollider](https://supercollider.github.io) and [TidalCycles](https://tidalcycles.org/docs/getting-started/tidal_start) installed.

Start SuperCollider + SuperDirt:

```bash
./startup.sh
```

Wait for `SuperDirt: ready` in the output, then open `says.tidal` in your editor and evaluate the patterns. That's it.

## What the LFO trick is doing

Each LFO has a period measured in cycles (not seconds). At 150 BPM with 4 subdivisions, one cycle is about 1.6 seconds. The three LFOs use periods of 32, 37, and 19 — all primes — so they drift out of phase with each other over time and the texture never repeats in an obvious way.
