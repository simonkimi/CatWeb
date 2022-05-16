@echo off
cd lib/l10n
python gen_arb.py
cd ../..
flutter gen-l10n