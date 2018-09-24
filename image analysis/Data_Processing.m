%%Load Data into Variable
data = load('examgrades.mat');
grades = data.grades;
%% Visualize Data
figure; plot(grades);

%% Switch X and Y
figure; plot(grades');
xlabel('Exam #')
ylabel('Exam Grade')

%% Try other graphs
figure; boxplot(grades);
title('Box plots are really helpful maybe')

%% Bar Graph
grade_averages = mean(grades);
figure; bar(grade_averages);
%% Standard error, labels
%calculate standard error

exam_std = std(grades);
N = length(grades);
exam_sterr = exam_std/sqrt(N);
%%
figure; bar(grade_averages);
hold on
errorbar(grade_averages,exam_sterr);
exam_labels = {'test','quiz','popquiz','dance-off', 'final'};
xticklabels(exam_labels)
title('I am incredulous')
%% set y limits
ylim([72,77])
