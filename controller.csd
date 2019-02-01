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

instr 1 ; expects MIDI controller input on channel 1
; run and move your midi controller to see result

iminAmp = 0
imaxAmp = 1

iminPitch = 80
imaxPitch = 1000

ichan = 1 
ictlno = 7
 
        initc7  ichan, ictlno, 1            ; start at max. volume
kamp    ctrl7   ichan, ictlno, iminAmp, imaxAmp   ; controller 7
kpitch  ctrl7   ichan, ictlno, iminPitch, imaxPitch   ; controller 7

asig    oscil   1, kpitch, 1
        outs    asig, asig

endin

</CsInstruments>
<CsScore>
f 1 0 4096 10 1

i1 0 20

e
</CsScore>
</CsoundSynthesizer>
