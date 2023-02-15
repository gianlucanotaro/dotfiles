#include QMK_KEYBOARD_H

enum layer_names{
  _QWERTY,
  _LOWER,
  _RAISE,
  _NUMPAD,
  _GAME,
  _MOUSE
};

enum custom_keycodes {
    QWERTY = SAFE_RANGE,
    LOWER,
    RAISE,
};

#define _QWERTY 0
#define _LOWER 1
#define _RAISE 2

//tapdnace declarations
enum {
  TD_ESC_CAPS,
  TD_J_ESC,
};

//Tap Dance Definitions
qk_tap_dance_action_t tap_dance_actions[] = {
  //Tap once for Esc, twice for Caps Lock
    [TD_ESC_CAPS]  = ACTION_TAP_DANCE_DOUBLE(KC_ESC, KC_CAPS),
    [TD_J_ESC]  = ACTION_TAP_DANCE_DOUBLE(KC_J, KC_ESC),
// Other declarations would go here, separated by commas, if you have them
}; 

const uint16_t PROGMEM jk_combo [] = {KC_J,KC_K, COMBO_END};
const uint16_t PROGMEM kl_combo [] = {KC_K,KC_L, COMBO_END};
const uint16_t PROGMEM lscl_combo [] = {KC_L,KC_SCLN, COMBO_END};
const uint16_t PROGMEM df_combo [] = {KC_D,KC_F, COMBO_END};
const uint16_t PROGMEM sd_combo [] = {KC_S,KC_D, COMBO_END};
const uint16_t PROGMEM as_combo [] = {KC_A,KC_S, COMBO_END};
const uint16_t PROGMEM sf_combo [] = {KC_S,KC_F, COMBO_END};
const uint16_t PROGMEM af_combo [] = {KC_A,KC_F, COMBO_END};
const uint16_t PROGMEM lj_combo [] = {KC_L,KC_J, COMBO_END};
const uint16_t PROGMEM jscl_combo [] = {KC_J,KC_SCLN, COMBO_END};


combo_t key_combos[COMBO_COUNT] = {
    COMBO(jk_combo, KC_LEFT_GUI),
    COMBO(df_combo, KC_LEFT_GUI),
    COMBO(kl_combo, KC_RALT),
    COMBO(sd_combo, KC_RALT),
    COMBO(lscl_combo, KC_LCTL),
    COMBO(as_combo, KC_LCTL),
    COMBO(sf_combo, KC_MEH),
    COMBO(kl_combo, KC_MEH),
    COMBO(af_combo, KC_HYPR),
    COMBO(jscl_combo, KC_HYPR),
};

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {

 [_QWERTY] = LAYOUT_split_3x6_3(
    
                    KC_NO, KC_Q, KC_W, KC_E, KC_R, KC_T,                      KC_Y, KC_U, KC_I, KC_O, KC_P, KC_NO,
                    KC_NO, KC_A, KC_S, KC_D, KC_F, KC_G,                      KC_H, TD(TD_J_ESC), KC_K, KC_L, KC_SCLN, KC_NO, 
                    KC_NO, KC_Z, KC_X, KC_C, KC_V, KC_B,                      KC_N, KC_M, KC_COMM, KC_DOT, KC_SLSH, KC_NO,
                                          KC_TAB, KC_BSPC, MO(1),       MO(2), KC_SPC, KC_ENT),

[_LOWER] = LAYOUT_split_3x6_3(

                  KC_TAB, KC_1, KC_2, KC_3, KC_4, KC_5,                        KC_6, KC_7, KC_8, KC_9, KC_0, KC_QUOTE,
                  KC_F1, KC_F2, KC_F3, KC_F4, KC_F5, KC_F6,                    KC_LEFT, KC_DOWN, KC_UP, KC_RGHT, KC_NO, KC_NO,
                  KC_F7, KC_F8, KC_F9, KC_F10, KC_F11, KC_F12,                 KC_VOLD, KC_VOLU, KC_MUTE, KC_NO, KC_NO, KC_NO, 
                                      KC_LGUI, KC_TRNS, KC_TRNS,         KC_ENT, MO(3), KC_RALT),

[_RAISE] = LAYOUT_split_3x6_3(

                  KC_TAB, KC_EXLM, KC_AT, KC_HASH, KC_DLR, KC_PERC,            KC_CIRC, KC_AMPR, KC_ASTR, KC_LPRN, KC_RPRN, KC_BSPC, 
                  KC_LCTL, KC_NO, KC_INS, KC_NO, KC_NO, KC_NO,                 KC_MINS, KC_EQL, KC_LBRC, KC_RBRC, KC_BSLS, KC_GRV,
                  KC_LSFT, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO,                  KC_UNDS, KC_PLUS, KC_LCBR, KC_RCBR, KC_PIPE, KC_TILD, 
                                            KC_LGUI, MO(3), KC_SPC,       KC_TRNS, KC_TRNS, KC_RALT),
};
