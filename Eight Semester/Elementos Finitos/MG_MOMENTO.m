function [Z] = MG_MOMENTO(A,x,L,I,E)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
Matriz_general2=[ ((A*(cos(x)^2))+((12*I/(L^2)))*(sin(x)^2))      (A-(12*I/(L^2)))*(cos(x)*sin(x))            -6*I/L*sin(x)    -((A*(cos(x)^2))+(12*I/(L^2)*(sin(x)^2)))    -(A-(12*I/(L^2)))*(cos(x)*sin(x))                      -6*I/L*sin(x);
                  (A-(12*I/(L^2)))*(cos(x)*sin(x))                (A*(sin(x)^2))+(12*I/(L^2)*(cos(x)^2))     6*I/L*cos(x)     -(A-(12*I/(L^2)))*(cos(x)*sin(x))            -((A*(sin(x)^2))+(12*I/(L^2)*(cos(x)^2)))               6*I/L*cos(x);
                   -6*I/L*sin(x)                                  6*I/L*cos(x)                                   4*I            6*I/L*sin(x)                                 -6*I/L*cos(x)                                                   2*I;
                   -((A*(cos(x)^2))+(12*I/(L^2)*(sin(x)^2)))     -(A-(12*I/(L^2)))*(cos(x)*sin(x))            6*I/L*sin(x)     ((A*(cos(x)^2))+((12*I/(L^2)))*(sin(x)^2))     (A-(12*I/(L^2)))*(cos(x)*sin(x))        6*I/L*sin(x);
                   -(A-(12*I/(L^2)))*(cos(x)*sin(x))             -((A*(sin(x)^2))+(12*I/(L^2)*(cos(x)^2)))    -6*I/L*cos(x)     (A-(12*I/(L^2)))*(cos(x)*sin(x))     (A* (sin(x)^2))+(12*I/(L^2)*(cos(x)^2))         -6*I/L*cos(x);
                   -6*I/L*sin(x)                                 6*I/L*cos(x)                                    2*I            6*I/L*sin(x)                                       -6*I/L*cos(x)                                             4*I];
Z=(E/L)*Matriz_general2; 
end