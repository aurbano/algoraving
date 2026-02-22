(
s.options.numBuffers = 1024 * 256;
s.options.memSize = 8192 * 16;
s.options.numWireBufs = 64;
s.options.maxNodes = 1024 * 32;
s.options.numInputBusChannels = 2;
s.options.numOutputBusChannels = 2;

s.waitForBoot {
    ~dirt = SuperDirt(2, s);
    ~dirt.loadSoundFiles;
    ~dirt.start(57120, 0 ! 12);
    s.sync;
    "SuperDirt: ready".postln;
};
)
