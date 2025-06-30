#include <IRremote.hpp>  // libreria corretta versione 3.x

const int RECV_PIN = 11;

// MAPPA SEGMENTI 0-9 (A-G)
const byte digits[10][7] = {
  { 1, 1, 1, 1, 1, 1, 0 },  // 0
  { 0, 1, 1, 0, 0, 0, 0 },  // 1
  { 1, 1, 0, 1, 1, 0, 1 },  // 2
  { 1, 1, 1, 1, 0, 0, 1 },  // 3
  { 0, 1, 1, 0, 0, 1, 1 },  // 4
  { 1, 0, 1, 1, 0, 1, 1 },  // 5
  { 1, 0, 1, 1, 1, 1, 1 },  // 6
  { 1, 1, 1, 0, 0, 0, 0 },  // 7
  { 1, 1, 1, 1, 1, 1, 1 },  // 8
  { 1, 1, 1, 1, 0, 1, 1 }   // 9
};

// PIN SEGMENTI 0-7
const int segmentPins[7] = { 2, 3, 4, 5, 6, 7, 8 };

int digit[2] = { 0, 0 }; // current digit + on/off boolean


void setup() {

  inizializeCodeMap();
  Serial.begin(9600);
  IrReceiver.begin(RECV_PIN, ENABLE_LED_FEEDBACK);
  Serial.println("Ricevitore IR pronto. Premi un tasto sul telecomando.");

  for (int i = 0; i < 7; i++)
    pinMode(segmentPins[i], OUTPUT);

  for (int i = 0; i < 7; i++)
    digitalWrite(segmentPins[i], 0);

}


void loop() {

  if (IrReceiver.decode()) {
    Serial.print("Codice ricevuto: 0x");
    Serial.println(IrReceiver.decodedIRData.command, HEX);
    updateNumber((IrReceiver.decodedIRData.command));
    IrReceiver.resume(); // PRONTO PER IL PROSSIMO SEGNALE
  }
  
}

short codeMap[0x100];

void inizializeCodeMap() {
	for(int i = 0; i <= 0xff; i++) {
		codeMap[i] = -1;
	}
	// VALORI TELECOMANDO ELEGOO
	codeMap[0x16] = 0;
	codeMap[0x0C] = 1;
	codeMap[0x18] = 2;
	codeMap[0x5E] = 3;
	codeMap[0x08] = 4;
	codeMap[0x1C] = 5;
	codeMap[0x5A] = 6;
	codeMap[0x42] = 7;
	codeMap[0x52] = 8;
	codeMap[0x4A] = 9;
	codeMap[0x45] = 10; // on/off
	codeMap[0x09] = 11; // up (user-defined function)
	codeMap[0x07] = 12;  // down (user-defined function)
}


void updateNumber(unsigned long code) {
  
  if(code <= 0 || code > 0xff) {
  	Serial.print("Code not in [0x00, 0xff] (!!!)");
	return;
  }
  
  if(codeMap[code] == -1) return; // (NO KNOWN COMMAND FOUND)

  short value = codeMap[code];

  if(value == 10) {
  	toggleStatus();
  	return;
  }

  if(!digit[1]) return; // if display is off only on/off is available!

  if(value == 11) {
  	up();
	return;	
  }
  
  if(value == 12) {
    down();
    return;
  }
  
  digit[0] = value;
  showNumber();

}


void toggleStatus() {
	delay(100);
	if(digit[1]) { // on -> off
	  offDisplay();
	  digit[1] = 0;
	  return;
	}
	// off -> on
	showNumber();
	digit[1] = 1;
}

void offDisplay() {
	Serial.println("Turning off display...");
	for (int i = 0; i < 7; i++)
	  digitalWrite(segmentPins[i], 0);
	Serial.println("Display turned off!");
}

void showNumber() {
	Serial.println("Showing digit: %d", digit[0]);
	for (int i = 0; i < 7; i++)
      digitalWrite(segmentPins[i], digits[digit[0]][i]);
}

void up() {
	delay(100);
	if(digit[0] == 9) return;
	digit[0]++;
	showNumber();
}

void down() {
	delay(100);
	if(digit[0] == 0) return;
	digit[0]--;
	showNumber();
}

