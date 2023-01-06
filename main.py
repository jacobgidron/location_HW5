# import soundfile as sf
import numpy as np
# import audioread
import scipy as sp
# This is a sample Python script.
# Press Double Shift to search everywhere for classes, files, tool windows, actions, and settings.


def print_hi(name):
    # Use a breakpoint in the code line below to debug your script.
    print(f'Hi, {name}')  # Press Ctrl+F8 to toggle the breakpoint.

# python for :
# sampleRate = 2048000;
# foffset = 0;
# [ samples , Fs ] = audioread (’ rtlsdr -1575 _42 . wav ’);
# ms = 32
# s = samples (1: ms * sampleRate /1000 ,1) ...
# + sqrt ( -1)* samples (1: ms * sampleRate /1000 ,2);



data, samplerate = sf.read('existing_file.wav')
data, samplerate = sp.io.wavfile.read("somefile")# Press Shift+F10 to execute it or replace it with your code.

# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    print_hi('PyCharm')

# See PyCharm help at https://www.jetbrains.com/help/pycharm/
