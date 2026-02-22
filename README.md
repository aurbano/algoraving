# algoraving

Live coding music experiments with [TidalCycles](https://tidalcycles.org). Nothing serious, just messing around.

## What's in here

**`says.tidal`** — a (highly inaccurate and simple) TidalCycles cover/interpretation of Nils Frahm's *Says*. Two layers running at 150 BPM:

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
