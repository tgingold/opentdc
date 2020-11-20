# OpenTDC

## Intro

OpenTDC is a Time to Digital Converter (TDC) and a Fine Delay (FD) design.

The TDC can timestamp a pulse with a precision below 1 ns, while the
FD can generate a pulse with the same precision.

TDC could be used to measure distances using time-of-flight of laser
pulses.  It is also used to measure the time-of-flight of particules
in High Energy Physic experiments.  A TDC could also be used in LIDAR.

The first implementation aims at providing a very simple TDC
implementation (based only on standard cells) and to test different
cell libraries, different delay elements and different layouts.
We will evaluate stability over time, power consumption and accuracy
(all of them are difficult to estimate using analog simulators).  This
first implementation could also be used by other people to (partially)
characterize the standard libraries.

It is forseen in a next implementation to add a FIFOs to handle pulse
bursts, add a logic to convert row results (number of taps) to a time
value and to be able to mesure pulse width.  It is also forseen to
improve handling to clock lines, and maybe to design a delay element.

You can also read the blog in the repository that tells about the
progress of this project.

Particularities of the design:
* Mixes different cell libraries
* Tool generated macros
* mixed languages (VHDL and verilog)

## Building

Regenerate verilog sources:

```bash
  make verilog
```

Harden the chip using openlane:

```bash
  make build
```

TODO: export the result:

```bash
  make result
```

## Dependencies

As the sources are partially written in VHDL, you need
(ghdl-yosys-plugin)[https://github.com/ghdl/ghdl-yosys-plugin]


## Testing

There are functional unit tests in `tb/`.

And a simple integration test with caraval in `tests/`.


## Contributing

Please use issues and pull-requests from github


## Copyright

SPDX-FileCopyrightText: (c) 2020 Tristan Gingold <tgingold@free.fr>

SPDX-License-Identifier: Apache-2.0
