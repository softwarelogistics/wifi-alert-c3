#include <Arduino.h>
#include "soc/efuse_reg.h"
#include "esp_system.h"
#include "esp_efuse.h"
#include "Freenove_WS2812_Lib_for_ESP32.h"


#define BUTTON_PIN1 4
#define BUTTON_PIN2 6
#define BUTTON_PIN3 1
#define LEDS_COUNT  1
#define LEDS_PIN	3
#define CHANNEL		0

uint32_t nextToggle = 0;
bool toggled = false;

Freenove_ESP32_WS2812 strip = Freenove_ESP32_WS2812(LEDS_COUNT, LEDS_PIN, CHANNEL);

void setup() {
  Serial.begin(115200);  
  strip.begin();

  Serial.println("WELCOME - SOFTWARE LOGISTICS");
  Serial.println("ALERT-C3 Button Production QA Tool.");
  Serial.println("VERSION 1.1.1");
  pinMode(BUTTON_PIN1, INPUT_PULLDOWN);
  pinMode(BUTTON_PIN2, INPUT_PULLDOWN);
  pinMode(BUTTON_PIN3, INPUT_PULLDOWN);
  Serial.println("startupcomplete;");
}

void loop() {
  if(millis() > nextToggle) {
    toggled = !toggled;
    nextToggle = millis() + 250;
    strip.setLedColorData(0, toggled ? 0xff0000 : 0x000000);
    strip.show();
  }

  if(digitalRead(BUTTON_PIN1) == HIGH) {
    Serial.println("Button 1 pressed");
  }

  if(digitalRead(BUTTON_PIN2) == HIGH) {
    Serial.println("Button 2 pressed");
  }

  if(digitalRead(BUTTON_PIN3) == HIGH) {
    Serial.println("Button 3 pressed");
  }

  delay(250);
  if(Serial.available()) {
    String line = Serial.readStringUntil('\n');
    if(line=="sn") {
       uint32_t reg = esp_efuse_read_reg(EFUSE_BLK4, 0);
       Serial.printf("SN=%08x\r\n", reg);
    }
    else if(line.startsWith("sn=")){
      uint32_t reg = strtoul(line.substring(3).c_str(), NULL, 16);
      esp_err_t err = esp_efuse_write_reg(EFUSE_BLK4, 0, reg);
      if(err != ESP_OK) {
        Serial.printf("Error writing SN: %d\r\n", err);
      }
      else {
        reg = esp_efuse_read_reg(EFUSE_BLK4, 0);
        Serial.printf("SN=%08x\r\n", reg);
      }
    }
  }
}
