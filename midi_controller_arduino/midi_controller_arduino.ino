#include "MIDI.h"

MIDI_CREATE_DEFAULT_INSTANCE();

const int NUM_CTRLS = 3;

const int CTRL_PINS[] = {0, 1, 2};

int VALS[NUM_CTRLS];

void setup() {
  MIDI.begin(1);
  Serial.begin(115200);
}

void read_ctrl(int ctrl_num) {
  // put your main code here, to run repeatedly:
  int tmp = analogRead(CTRL_PINS[ctrl_num]) / 8;

  if (tmp != VALS[ctrl_num]) {

    // Cont #, Cont val, channel
    MIDI.sendControlChange(7, tmp, ctrl_num + 1);
    VALS[ctrl_num] = tmp;
  }
}

void loop() {
  for (int i = 0; i < NUM_CTRLS; i++) {
    read_ctrl(i);
  }
  
  delay(10);
}
