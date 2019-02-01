#include "MIDI.h"

MIDI_CREATE_DEFAULT_INSTANCE();

const int CONTROLLER_00_PIN = 0;

int val_00 = 0;

void setup() {
  MIDI.begin(1);
  Serial.begin(115200);
}

void loop() {
  // put your main code here, to run repeatedly:
  int tmp = analogRead(CONTROLLER_00_PIN) / 8;

  if (tmp != val_00) {

    // Cont #, Cont val, channel
    MIDI.sendControlChange(7, tmp, 1);
    val_00 = tmp;
  }

  delay(10);
}
