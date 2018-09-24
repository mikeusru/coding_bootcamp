%% Variables, Strings, Scalars, Vectors, Matrices
a = 1;
a
%%
a = 'hello world';
a
%%
a = 1:10;
a
%%
a(1)
%%
a = magic(5);
a
%%
size(a)
%%
a
a(3)
a(6)
a(3,4)
%%
b = a(3);
b
%%
b = [5, 10];
b
%%
b = [a(3),a(4)];
b
%%
c = sin(b/2)
%%
b = [1,2,3;4,5,6;7,8,9]

%% Visualizing Data
a = 1:50;
figure; 
plot(a);
%% Pretty it up
y = sin(a/2);
figure; plot(a,y,'color','r','linewidth',3)
xlabel('Time','Fontsize',18)
ylabel('Amplitude','Fontsize',18)
xticks([0,50]);
yticks(round([min(y),max(y)]));