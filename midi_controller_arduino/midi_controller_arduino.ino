#include "MIDIUSB.h"

const int CONTROLLER_00_PIN = 0;

int val_00 = 0;

void setup() {
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  int tmp = analogRead(CONTROLLER_00_PIN) / 8;

  if (tmp != val_00) {
    MIDImessage(176, 1, tmp);
    val_00 = tmp;
  }

  delay(10);
}

void noteOn(byte channel, byte pitch, byte velocity) {
  midiEventPacket_t noteOn = {0x09, 0x90 | channel, pitch, velocity};
  MidiUSB.sendMIDI(noteOn);
}

void noteOff(byte channel, byte pitch, byte velocity) {
  midiEventPacket_t noteOff = {0x08, 0x80 | channel, pitch, velocity};
  MidiUSB.sendMIDI(noteOff);
}
