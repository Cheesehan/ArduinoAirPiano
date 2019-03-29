#include <CapacitiveSensor.h>

CapacitiveSensor cs_4_2 = CapacitiveSensor(4, 2); // 10M resistor between pins 4 & 2, pin 2 is sensor pin, add a wire and or foil if desired
CapacitiveSensor cs_4_6 = CapacitiveSensor(4, 6);
CapacitiveSensor cs_4_8 = CapacitiveSensor(4, 8);
CapacitiveSensor cs_4_10 = CapacitiveSensor(4, 10);
CapacitiveSensor cs_4_12 = CapacitiveSensor(4, 12);

unsigned long next_print = 0;

void setup()
{
  Serial.begin(9600);
}

void loop()
{
  // read and print every 200 ms
  long total1 = cs_4_2.capacitiveSensor(30);
  long total2 = cs_4_6.capacitiveSensor(30);
  long total3 = cs_4_8.capacitiveSensor(30);
  long total4 = cs_4_10.capacitiveSensor(30);
  long total5 = cs_4_12.capacitiveSensor(30);
  if (millis() > next_print) {
    Serial.print(total1); // print sensor output 1
    Serial.print('\t');
    Serial.print(total2);
    Serial.print('\t');
    Serial.print(total3);
    Serial.print('\t');
    Serial.print(total4);
    Serial.print('\t');
    Serial.println(total5);
    next_print = millis() + 100;
  }
}
