#!/bin/sh

mkdir -p OTF

for dir in ExtraLight Light Normal Regular Medium Bold Heavy; do
  cd "$dir/OTC"
  makeotf -f cidfont.ps.OTC.CL -omitMacNames -ff features.OTC.CL -fi cidfontinfo.OTC.CL -mf ../../FontMenuNameDB -r -nS -cs 3 -ch ../../UniSourceHanMonoCL-UTF32-H -ci ../../SourceHanMono_CL_sequences.txt ; tx -cff +S cidfont.ps.OTC.CL CFF.OTC.CL ; sfntedit -a CFF=CFF.OTC.CL "SourceHanMonoC-$dir.otf"
  mv "SourceHanMonoC-$dir.otf" ../../OTF
  rm CFF.OTC.CL
  cd ../../
done

zip source-han-mono-classic-otf.zip LICENSE.txt OTF/*
