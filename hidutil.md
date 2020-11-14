### 键位映射
```
hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000039,"HIDKeyboardModifierMappingDst":0x7000000E0},{"HIDKeyboardModifierMappingSrc":0x7000000E0,"HIDKeyboardModifierMappingDst":0x700000039}]}'

U 和 \
hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000031,"HIDKeyboardModifierMappingDst":0x700000018},{"HIDKeyboardModifierMappingSrc":0x700000018,"HIDKeyboardModifierMappingDst":0x700000031}]}'

U 和 option
hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x7000000E6,"HIDKeyboardModifierMappingDst":0x700000018},{"HIDKeyboardModifierMappingSrc":0x700000018,"HIDKeyboardModifierMappingDst":0x7000000E6}]}'

恢复
hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x7000000E6,"HIDKeyboardModifierMappingDst":0x7000000E6},{"HIDKeyboardModifierMappingSrc":0x700000018,"HIDKeyboardModifierMappingDst":0x700000018}]}'


hidutil property --get "UserKeyMapping"

Keyboard Caps Lock 0x39

Keyboard Left Control 0xE0

Keyboard \ and | 0x31

Keyboard u and U 0x18

Keyboard Right Alt 0xE6

Keyboard Right Shift 0xE5

Keyboard Right Control 0xE4
```


https://developer.apple.com/library/archive/technotes/tn2450/_index.html