function [ CA_code ] = Generate_CA( PRN_num, switch_bit )
%
%   


% INPUTS
% PRN_num               PRN number for code you want to generate. Can be [1 - 32]
% switch_bit            True = switch 0s and 1s to 1s and -1s

% OUTPUTS
% CA_code               1023 bit CA code for specific PRN

if nargin < 2
    switch_bit = False;
end

%------ generate C/A code for PRN -----------------------------------------
bits = 1023;            % number of bits for CA code  

% Choose phase selectors for each PRN
if PRN_num == 1
    S1 = 2;
    S2 = 6;
elseif PRN_num == 2
    S1 = 3;
    S2 = 7;
elseif PRN_num == 3
    S1 = 4;
    S2 = 8; 
elseif PRN_num == 4
    S1 = 5;
    S2 = 9;
elseif PRN_num == 5
    S1 = 1;
    S2 = 9;
elseif PRN_num == 6
    S1 = 2;
    S2 = 10;
elseif PRN_num == 7
    S1 = 1;
    S2 = 8;
elseif PRN_num == 8
    S1 = 2;
    S2 = 9;
elseif PRN_num == 9
    S1 = 3;
    S2 = 10;
elseif PRN_num == 10
    S1 = 2;
    S2 = 3;
elseif PRN_num == 11
    S1 = 3;
    S2 = 4;
elseif PRN_num == 12
    S1 = 5;
    S2 = 6;
elseif PRN_num == 13
    S1 = 6;
    S2 = 7;
elseif PRN_num == 14
    S1 = 7;
    S2 = 8;
elseif PRN_num == 15
    S1 = 8;
    S2 = 9;
elseif PRN_num == 16
    S1 = 9;
    S2 = 10;
elseif PRN_num == 17
    S1 = 1;
    S2 = 4;
elseif PRN_num == 18
    S1 = 2;
    S2 = 5;
elseif PRN_num == 19
    S1 = 3;
    S2 = 6;
elseif PRN_num == 20
    S1 = 4;
    S2 = 7;
elseif PRN_num == 21
    S1 = 5;
    S2 = 8;
elseif PRN_num == 22
    S1 = 6;
    S2 = 9;
elseif PRN_num == 23
    S1 = 1;
    S2 = 3;
elseif PRN_num == 24
    S1 = 4;
    S2 = 6;
elseif PRN_num == 25
    S1 = 5;
    S2 = 7;
elseif PRN_num == 26
    S1 = 6;
    S2 = 8;
elseif PRN_num == 27
    S1 = 7;
    S2 = 9;
elseif PRN_num == 28
    S1 = 8;
    S2 = 10;
elseif PRN_num == 29
    S1 = 1;
    S2 = 6;    
elseif PRN_num == 30
    S1 = 2;
    S2 = 7;
elseif PRN_num == 31
    S1 = 3;
    S2 = 8;
elseif PRN_num == 32
    S1 = 4;
    S2 = 9;
    
% extra PRNs for ground system validation
elseif PRN_num == 33
    S1 = 5;
    S2 = 10;
elseif PRN_num == 34
    S1 = 4;
    S2 = 10;
elseif PRN_num == 35
    S1 = 1;
    S2 = 7;
elseif PRN_num == 36
    S1 = 2;
    S2 = 8;
elseif PRN_num == 37
    S1 = 4;
    S2 = 10;
end


% Initialize your shift registers to one
G1 = ones(1, 10);
G2 = ones(1, 10);

% declare CA code (will assign values later)
CA_code = zeros(1, bits);

% run though the entire code
for i=1:bits
    G2i = xor( G2(S1), G2(S2) );

    % ------ CA ------
    CA_code(i) = xor( G1(10), G2i);

    % ------ G1 ------
    newbit1 = xor( G1(3), G1(10) );
    G1 = [newbit1 G1(1:9)];              % shift G1 register

    % ------ G2 ------
    % generate new G2 bit
    xor1 = xor( G2(2), G2(3) );
    xor2 = xor( xor1, G2(6) );
    xor3 = xor( xor2, G2(8) );
    xor4 = xor( xor3, G2(9) );
    newbit2 = xor(xor4, G2(10));
    G2 = [newbit2 G2(1:9)];

end

if switch_bit
    % change from 0s and 1s to 1s and -1s
    CA_code = (CA_code == 0) * 1 + (CA_code == 1) * -1;
end

end

