@echo off
cd lib/l10n
python json2arb.py
cd ../..
flutter gen-l10n