clear all
clc
mc='hwk machine vib data.xls'; %importing data

r1='C4:C6004';
m1=xlsread(mc,r1);  %defining the data range

m=zeros(500,12);  %bin matrix
N=2^9;            %power of 2 closest to bin size
ts=0.001;         %sampling time
t=0.5:0.25:6;      %time range
fs=1/ts;          %sampling frequency
f=fs*((0:((N/2)-1))/(N));   %scaled frequency

%transfering values in corresponding bins
for i = 1:12
    for k = 1:500
    if i == 1
            
        m(k,1) = m1(i*k,1);
    elseif i == 2
                
        m(k,2) = m1((500+k),1);
    elseif i == 3
                    
        m(k,3) = m1((1000+k),1);
    elseif i == 4
                        
        m(k,4) = m1((1500+k),1);
    elseif i == 5
                            
        m(k,5) = m1((2000+k),1);
    elseif i == 6
                                
        m(k,6) = m1((2500+k),1);
    elseif i==7
                                    
        m(k,7)=m1((3000+k),1);
    elseif i==8
                                        
        m(k,8)=m1((3500+k),1);
    elseif i==9
                                            
        m(k,9)=m1((4000+k),1);
    elseif i==10
                                                
        m(k,10)=m1((4500+k),1);
    elseif i==11
                                                    
        m(k,11)=m1((5000+k),1);
    elseif i==12
        m(k,12)=m1((5500+k),1);
    end
                                                
    end
end
 
s=fft(m,N); %calculating windowed DFT of data matrix
mesh(t,f,(abs(s(1:256,1:0.5:12))))  %plotting the 3D graph of DFT vs time
xlabel('Time(S)');
ylabel('Frequency(Hz)');
zlabel('Amplitude');
view([-25,76]);     %rotating the plot for better viewing
title('3D plot of DFT VS Time')
