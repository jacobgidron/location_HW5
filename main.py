# import soundfile as sf
import numpy as np
# import audioread
import scipy as sp
# This is a sample Python script.
# Press Double Shift to search everywhere for classes, files, tool windows, actions, and settings.
from scipy.io import wavfile


# python for :
# sampleRate = 2048000;
# foffset = 0;
# [ samples , Fs ] = audioread (’ rtlsdr -1575 _42 . wav ’);
# ms = 32
# s = samples (1: ms * sampleRate /1000 ,1) ...
# + sqrt ( -1)* samples (1: ms * sampleRate /1000 ,2);





# Press the green button in the gutter to run the script.
if __name__ == '__main__':
     samplerate,samples = sp.io.wavfile.read(r"C:\Users\Administrator\PycharmProjects\location_HW5\rtlsdr-1575-42.wav")
     s = samples[:samplerate*//]
     ms = 32

# See PyCharm help at https://www.jetbrains.com/help/pycharm/
