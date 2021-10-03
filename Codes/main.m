%% Assignment 1

%%Part A: Developing a function or Huffman Coding Algorithm

close all; clc; clear;

alphabet = [1 2 3];
p = [0.4 0.5 0.1];
global CODE

s = cell(length(p),1);
s = {1,2,3};
[p,i] = sort(p);
p(2) = p(1) + p(2);
p(1) = [];
s = s(i);
s{2} = {s{1},s{2}};
s(1) = [];

%%

%Question 01

makecode(s,[]);

%%

%Question 02

signal = ['1' '2' '3' '4' '5'];
signal_pmf = [0.23 0.47 0.03 0.15 0.12];

code_dictionary = huffman_code(signal,signal_pmf)

%%

%Question 03

alphabet = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'];
frequency = [8.16 1.492 2.782 4.153 13.004 2.228 2.015 6.094 6.966 0.153 0.778 4.025 2.406 6.749 7.507 1.929 0.095 5.787 6.327 9.056 2.758 0.978 2.360 0.150 1.974 0.074];
total_frequency = sum(frequency);
alphabet_pmf = frequency/total_frequency;

alphabet_dictionary = huffman_code(alphabet,alphabet_pmf)

[Expected_Length,Entropy,Efficiency] = efficiency(alphabet_pmf,alphabet_dictionary)

%%

%Question 04

signal = 'kehelella';
symbols = 'abcdefghijklmnopqrstuvwxyz';

encoded_name = huffman_encode(signal,symbols,alphabet_dictionary)

%%

%%Part B: Arithmetic Coding Algorithms

%Question 01

symbols = [0,1,2,3,4,5,6,7,8,9];
pdf = [0.1 0.1 0.05 0.05 0.2 0.1 0.05 0.05 0.05 0.25];

%%
%Question 02

index_no = [1,7,0,3,0,2];

[Tag,msg_probability,cdf,l_new,u_new] = arithmetic_encode(index_no,pdf);

%%

%Question 03

Binary_codeword = float_to_binary(Tag,msg_probability)

%%

%Question 04

[Tag_incremental,Bin_Tag_incremental,l_new_rescaled,u_new_rescaled] = incremental_encode(index_no,pdf)