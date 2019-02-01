# Arduino MIDI Controller over Serial

MIDI controller implemented using an Arduino and Hairless MIDI.

## Prerequesites

### Software

- Install `Arduino IDE`
- Install `Hairless MIDI`
- Install `CSound` (optional)
  - CSound is used to consume MIDI. A DAW, such as Ableton, will also work.

### Hardware

- Arduino
- Potentiometers
- Breadboard

## Setup

1. Wire up potentiometers on breadboard
2. Load `midi_controller_arduino.ino` sketch onto Arduino board
3. Close Arduino IDE, unplug and replug Arduino board in
4. Start Hairless MIDI 
   - Set `Serial port` to where Arduino is plugged in
   - Set `MIDI Out` to `MIDI Through:0`

## Consume MIDI

Now that Hairless MIDI is producing a MIDI stream, we may consume it.

### Using CSound

The provided `*.csd` file will produce a sine wave whose parameters are tied to
the MIDI controller. Try adjusting the pots and see what happens!

```
$ csound controller.csd
```
