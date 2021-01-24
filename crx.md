#### download extension
```shell
➜ wget -q https://github.com/FelisCatus/SwitchyOmega/releases/download/v2.5.20/SwitchyOmega_Chromium.crx
```

#### offset
```shell
hexdump -C SwitchyOmega_Chromium.crx|head -n 20
00000000  43 72 32 34 02 00 00 00  26 01 00 00 00 01 00 00  |Cr24....&.......|
00000010  30 82 01 22 30 0d 06 09  2a 86 48 86 f7 0d 01 01  |0.."0...*.H.....|
00000020  01 05 00 03 82 01 0f 00  30 82 01 0a 02 82 01 01  |........0.......|
00000030  00 92 1c 19 25 3e fa 6e  d4 34 e0 41 0c 38 5b 59  |....%>.n.4.A.8[Y|
00000040  3c b1 12 0f 54 e6 49 58  db 2e 3b 34 3b 27 ac 0f  |<...T.IX..;4;'..|
00000050  d1 ed f1 89 65 14 f7 c9  de a9 ad 6d 24 06 56 eb  |....e......m$.V.|
00000060  e6 c4 7d 46 2b f8 d4 3b  64 1c 11 66 fc 6c 7b 8e  |..}F+..;d..f.l{.|
00000070  8e 84 65 ab 6d 1f 8b 98  f9 02 af 74 3b c1 4a 11  |..e.m......t;.J.|
00000080  3f b2 e4 3f 0f c4 2c a2  dd 69 a7 aa e8 84 c1 a1  |?..?..,..i......|
00000090  39 70 d9 9a 0a cc 3f 1b  62 65 3b e6 d9 3a d7 50  |9p....?.be;..:.P|
000000a0  fd 02 8e bc cc 41 01 e8  00 05 88 a6 10 67 d2 bc  |.....A.......g..|
000000b0  23 15 50 4b e9 ca 6c ac  d2 00 61 2e 87 21 ef 6c  |#.PK..l...a..!.l|
000000c0  cf 02 22 54 06 47 f4 cf  c0 6d 8d 84 ee 78 c4 5c  |.."T.G...m...x.\|
000000d0  45 79 2b 49 e4 4f 2f 28  14 0d 09 d9 d5 39 10 58  |Ey+I.O/(.....9.X|
000000e0  c6 18 06 9f f3 aa 90 f9  82 0c 72 b4 09 25 10 c4  |..........r..%..|
000000f0  33 47 d1 e7 d2 5a ae e6  ce e2 b9 40 20 8a 16 f2  |3G...Z.....@ ...|
00000100  b0 f9 ff f1 68 74 d1 98  f9 17 24 a9 2b ff ca 72  |....ht....$.+..r|
00000110  91 b7 25 2e d4 5b 10 b6  f2 84 ad f3 3e 59 47 76  |..%..[......>YGv|
00000120  22 9a 75 fe 1d 7d cf df  a5 74 98 2d 69 80 ce 28  |".u..}...t.-i..(|
00000130  ef 02 03 01 00 01 6d 3a  7b f6 af 33 12 65 93 3e  |......m:{..3.e.>|

➜ hexdump -s 0x000000b0 -C SwitchyOmega_Chromium.crx|head
000000b0  23 15 50 4b e9 ca 6c ac  d2 00 61 2e 87 21 ef 6c  |#.PK..l...a..!.l|
000000c0  cf 02 22 54 06 47 f4 cf  c0 6d 8d 84 ee 78 c4 5c  |.."T.G...m...x.\|
000000d0  45 79 2b 49 e4 4f 2f 28  14 0d 09 d9 d5 39 10 58  |Ey+I.O/(.....9.X|
000000e0  c6 18 06 9f f3 aa 90 f9  82 0c 72 b4 09 25 10 c4  |..........r..%..|
000000f0  33 47 d1 e7 d2 5a ae e6  ce e2 b9 40 20 8a 16 f2  |3G...Z.....@ ...|
00000100  b0 f9 ff f1 68 74 d1 98  f9 17 24 a9 2b ff ca 72  |....ht....$.+..r|
00000110  91 b7 25 2e d4 5b 10 b6  f2 84 ad f3 3e 59 47 76  |..%..[......>YGv|
00000120  22 9a 75 fe 1d 7d cf df  a5 74 98 2d 69 80 ce 28  |".u..}...t.-i..(|
00000130  ef 02 03 01 00 01 6d 3a  7b f6 af 33 12 65 93 3e  |......m:{..3.e.>|
00000140  98 62 0a 14 a1 f5 bf a0  6e 21 6f 80 7e 04 3e 92  |.b......n!o.~.>.|

hexdump -s 0x000000b2 -C SwitchyOmega_Chromium.crx|head
000000b2  50 4b e9 ca 6c ac d2 00  61 2e 87 21 ef 6c cf 02  |PK..l...a..!.l..|
000000c2  22 54 06 47 f4 cf c0 6d  8d 84 ee 78 c4 5c 45 79  |"T.G...m...x.\Ey|
000000d2  2b 49 e4 4f 2f 28 14 0d  09 d9 d5 39 10 58 c6 18  |+I.O/(.....9.X..|
000000e2  06 9f f3 aa 90 f9 82 0c  72 b4 09 25 10 c4 33 47  |........r..%..3G|
000000f2  d1 e7 d2 5a ae e6 ce e2  b9 40 20 8a 16 f2 b0 f9  |...Z.....@ .....|
00000102  ff f1 68 74 d1 98 f9 17  24 a9 2b ff ca 72 91 b7  |..ht....$.+..r..|
00000112  25 2e d4 5b 10 b6 f2 84  ad f3 3e 59 47 76 22 9a  |%..[......>YGv".|
00000122  75 fe 1d 7d cf df a5 74  98 2d 69 80 ce 28 ef 02  |u..}...t.-i..(..|
00000132  03 01 00 01 6d 3a 7b f6  af 33 12 65 93 3e 98 62  |....m:{..3.e.>.b|
00000142  0a 14 a1 f5 bf a0 6e 21  6f 80 7e 04 3e 92 36 e5  |......n!o.~.>.6.|
```

#### dd split
```shell
➜ dd if=SwitchyOmega_Chromium.crx of=extension.zip bs=1 skip=$((0x000000b2))
957640+0 records in
957640+0 records out
957640 bytes (958 kB, 935 KiB) copied, 4.64238 s, 206 kB/s
```

#### unzip
```shell
unzip extension.zip
Archive:  extension.zip
warning [extension.zip]:  388 extra bytes at beginning or within zipfile
  (attempting to process anyway)
  inflating: AUTHORS
  inflating: COPYING
  inflating: _locales/cs/messages.json
  inflating: _locales/en/messages.json
  inflating: _locales/fa/messages.json
  inflating: _locales/zh/messages.json
  inflating: _locales/zh_CN/messages.json
  inflating: _locales/zh_TW/messages.json
  inflating: background.html
  inflating: css/options.css
  inflating: css/popup.css
  inflating: img/icons/draw_omega.js
  inflating: img/icons/omega-128.png
  inflating: img/icons/omega-128.svg
  inflating: img/icons/omega-48.png
  inflating: img/icons/omega-64.png
  inflating: img/icons/omega-action-16.png
  inflating: img/icons/omega-action-19.png
  inflating: img/icons/omega-action-24.png
  inflating: img/icons/omega-action-32.png
  inflating: img/icons/omega-action.svg
  inflating: js/background.js
  inflating: js/background_preload.js
  inflating: js/log_error.js
  inflating: js/omega.js
  inflating: js/omega_debug.js
  inflating: js/omega_decoration.js
  inflating: js/omega_pac.min.js
  inflating: js/omega_target.min.js
  inflating: js/omega_target_chromium_extension.min.js
  inflating: js/omega_target_popup.js
  inflating: js/omega_target_web.js
  inflating: js/omega_webext_proxy_script.min.js
  inflating: js/options.js
  inflating: js/options_guide.js
  inflating: js/popup.js
  inflating: js/switch_profile_guide.js
  inflating: lib/FileSaver/FileSaver.min.js
  inflating: lib/angular-animate/angular-animate.min.js
  inflating: lib/angular-bootstrap/ui-bootstrap-tpls.min.js
  inflating: lib/angular-i18n/angular-locale_en-us.js
  inflating: lib/angular-i18n/angular-locale_zh-cn.js
  inflating: lib/angular-i18n/angular-locale_zh-hk.js
  inflating: lib/angular-i18n/angular-locale_zh-tw.js
  inflating: lib/angular-ladda/angular-ladda.min.js
  inflating: lib/angular-loader/angular-loader.min.js
  inflating: lib/angular-sanitize/angular-sanitize.min.js
  inflating: lib/angular-spectrum-colorpicker/angular-spectrum-colorpicker.min.js
  inflating: lib/angular-ui-router/angular-ui-router.min.js
  inflating: lib/angular-ui-sortable/sortable.min.js
  inflating: lib/angular-ui-utils/validate.min.js
  inflating: lib/angular/angular.min.js
  inflating: lib/blob/Blob.js
  inflating: lib/bootstrap/css/bootstrap.min.css
  inflating: lib/bootstrap/fonts/glyphicons-halflings-regular.eot
  inflating: lib/bootstrap/fonts/glyphicons-halflings-regular.svg
  inflating: lib/bootstrap/fonts/glyphicons-halflings-regular.ttf
  inflating: lib/bootstrap/fonts/glyphicons-halflings-regular.woff
  inflating: lib/bootstrap/fonts/glyphicons-halflings-regular.woff2
  inflating: lib/bootstrap/js/dropdown.js
  inflating: lib/jquery-ui-1.10.4.custom.min.js
  inflating: lib/jquery/jquery.min.js
  inflating: lib/jqueryui-touch-punch/jquery.ui.touch-punch.min.js
  inflating: lib/jsondiffpatch/jsondiffpatch.min.js
  inflating: lib/ladda/ladda-themeless.min.css
  inflating: lib/ladda/ladda.min.js
  inflating: lib/ngprogress/ngProgress.min.js
  inflating: lib/script.js/script.min.js
  inflating: lib/shepherd.js/shepherd-theme-arrows.css
  inflating: lib/shepherd.js/shepherd.min.js
  inflating: lib/spectrum/spectrum.css
  inflating: lib/spectrum/spectrum.js
  inflating: lib/spin.js/spin.js
  inflating: lib/tether/tether.js
  inflating: options.html
  inflating: partials/about.html
  inflating: partials/apply_options_confirm.html
  inflating: partials/cannot_delete_profile.html
  inflating: partials/delete_attached.html
  inflating: partials/delete_profile.html
  inflating: partials/fixed_auth_edit.html
  inflating: partials/general.html
  inflating: partials/input_group_clear.html
  inflating: partials/io.html
  inflating: partials/new_profile.html
  inflating: partials/omega_profile_select.html
  inflating: partials/options_welcome.html
  inflating: partials/profile.html
  inflating: partials/profile_fixed.html
  inflating: partials/profile_pac.html
  inflating: partials/profile_rule_list.html
  inflating: partials/profile_switch.html
  inflating: partials/profile_unsupported.html
  inflating: partials/profile_virtual.html
  inflating: partials/rename_profile.html
  inflating: partials/replace_profile.html
  inflating: partials/reset_options_confirm.html
  inflating: partials/rule_remove_confirm.html
  inflating: partials/rule_reset_confirm.html
  inflating: partials/ui.html
  inflating: popup.html
  inflating: popup/css/dialog.css
  inflating: popup/css/index.css
  inflating: popup/index.html
  inflating: popup/js/i18n.js
  inflating: popup/js/index.js
  inflating: popup/js/keyboard.js
  inflating: popup/js/keyboard_help.js
  inflating: popup/js/loader.js
  inflating: popup/js/profiles.js
  inflating: popup/js/proxy_not_controllable.js
  inflating: popup/proxy_not_controllable.html
  inflating: manifest.json
   creating: _metadata/
  inflating: _metadata/verified_contents.json
```