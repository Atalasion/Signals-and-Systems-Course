clc;           
clear;        
close all;  

di=dir('p2\MapSet');
st={di.name};
nam=st(3:end);
len=length(nam);


PER_TRAIN=cell(2,len);
for i=1:len
   PER_TRAIN(1,i)={imread(['p2\MapSet','\',cell2mat(nam(i))])};
   temp=cell2mat(nam(i));
   PER_TRAIN(2,i)={temp(1)};
end

save('PER_TRAININGSET.mat','PER_TRAIN');
clear;
