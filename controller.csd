<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac -+rtmidi=portmidi -M0 ;;;realtime audio I/O with MIDI in
;-iadc    ;;;uncomment -iadc if RT audio input is needed too
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

gisine ftgen 0, 0, 4096, 10, 1

instr 1 ; expects MIDI controller input on channel 1
; run and move your midi controller to see result

iminAmp = 0
imaxAmp = 1

iminPitch = 70
imaxPitch = 440

ichanPitch = 1 
ichanAmp = 2
ichanMix = 3

ictlno = 7
 
        initc7  ichanPitch, ictlno, 0            ; start at max. volume
        initc7  ichanAmp,   ictlno, 1            ; start at max. volume

kamp    ctrl7   ichanAmp,   ictlno,   iminAmp,   imaxAmp     ; controller 7
kpitch  ctrl7   ichanPitch, ictlno,   iminPitch, imaxPitch   ; controller 7
kmix    ctrl7   ichanMix,   ictlno,   iminAmp,   imaxAmp     ; controller 7

asig    oscil   kamp, kpitch, 1

a1      foscil  kamp, kpitch, 1, 2, 3, gisine      ;OSC

        outs  a1 * (1 - kmix) + kmix * asig, a1 * (1 - kmix) + kmix * asig

endin

</CsInstruments>
<CsScore>
f 1 0 4096 10 1

i1 0 200

e
</CsScore>
</CsoundSynthesizer>
