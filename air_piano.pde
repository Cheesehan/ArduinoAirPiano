import processing.serial.*;
import processing.sound.*;

Serial myPort; // the serial port

// soundfiles
SoundFile note_do;
SoundFile note_re;
SoundFile note_mi;
SoundFile note_fa;
SoundFile note_so;

void setup() {
  // set the serial port
  println(Serial.list());
  myPort = new Serial(this, Serial.list()[1], 9600);
  // don't generate a serialEvent() unless you get a newline character
  myPort.bufferUntil('\n');
 
  // load soundfiles from the data folder
  note_do = new SoundFile(this, "316899__jaz-the-man-2__do-stretched.wav");
  note_re = new SoundFile(this, "316909__jaz-the-man-2__re-stretched.wav");
  note_mi = new SoundFile(this, "316907__jaz-the-man-2__mi-stretched.wav");
  note_fa = new SoundFile(this, "316905__jaz-the-man-2__fa-stretched.wav");
  note_so = new SoundFile(this, "316911__jaz-the-man-2__sol-stretched.wav");
}

void serialEvent(Serial myPort) {
  // get sensor values
  String str = myPort.readStringUntil('\n');
  float[] val = float(split(str, ','));
  
  print(val[0]);
  print('\t');
  print(val[1]);
  print('\t');
  print(val[2]);
  print('\t');
  print(val[3]);
  print('\t');
  println(val[4]);
  
  // deal with sensor values
  // do
  if (val[0] > 1000) {
    // stop the former sound when touching the key
    note_do.stop();
    // adjust the volumn by pressure
    float volumn = map(val[0], 1000, 10000, 0, 1);
    note_do.amp(volumn);
    // play and change the wave
    note_do.play();
  }
  
  // re
  if (val[1] > 1000) {
    // stop the former sound when touching the key
    note_re.stop();
    // adjust the volumn by pressure
    float volumn = map(val[1], 1000, 10000, 0, 1);
    note_re.amp(volumn);
    // play and change the wave
    note_re.play();
  }
  
  // mi
  if (val[2] > 1000) {
    // stop the former sound when touching the key
    note_mi.stop();
    // adjust the volumn by pressure
    float volumn = map(val[2], 1000, 10000, 0, 1);
    note_mi.amp(volumn);
    // play and change the wave
    note_mi.play();
  }
  
  // fa
  if (val[3] > 1000) {
    // stop the former sound when touching the key
    note_fa.stop();
    // adjust the volumn by pressure
    float volumn = map(val[3], 1000, 10000, 0, 1);
    note_fa.amp(volumn);
    // play and change the wave
    note_fa.play();
  }
  
  // so
  if (val[4] > 1000) {
    // stop the former sound when touching the key
    note_so.stop();
    // adjust the volumn by pressure
    float volumn = map(val[4], 1000, 10000, 0, 1);
    note_so.amp(volumn);
    // play and change the wave
    note_so.play();
  }
}
