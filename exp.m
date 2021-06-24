%{
This script showcases how to use the proposed team member replacement
algorithms proposed in the WWW'15 paper:
Liangyue Li, Hanghang Tong, Nan Cao, Kate Ehrlich, Yu-Ru Lin, Norbou Buchler. Replacing the Irreplaceable: 
Fast Algorithm for Team Member Recommendation. International World Wide Web Conference (WWW), 2015.

Author: Liangyue Li (Arizona State University)

%}

load DBLP;

%smola 
%currentTeam = [916232, 250177, 219532, 545532, 756929]; %paper index
%i0= 250177;

%hinton_1: 
%currentTeam = [208818, 554802, 455386, 218580, 822000]; %paper index
%i0= 218580;

%jiawei han_1
currentTeam = [750967, 124372, 167178, 620387, 3603, 582475];
i0 = 124372;

%jiawei han_2
%currentTeam = [37832, 785879, 721587, 124372, 260647];
%i0 = 124372;

%C. Faloutsos_1
%currentTeam = [603161, 175073, 206733, 185952, 314018];
%i0 = 185952;

%Philip S. Yu_1
%currentTeam = [414491, 722335, 912598, 124372, 247326];
%i0 = 247326;

%Philip S. Yu_2
%currentTeam = [399690, 216073, 431073, 247326, 551591];
%i0 = 247326;

dn=43; % number of skills
L = cell(1,dn);
for i=1:dn 
    L{i} = diag(count_label(:,i));
end

fileID=fopen('authorDict.txt');
authorDict=textscan(fileID,'%s','delimiter','\n');
authorDict=authorDict{1};

fprintf('We need to replace %s ...\n', authorDict{i0});

[score, edge_weight_matrix, edge_max] = label_direct_recommend(aa,L,currentTeam,i0,true);
top6 = topsix(score);

disp ('Using TEAMREP-BASIC after pruning, the top six candidates are:');
fprintf('%s \n', authorDict{top6});


%score = label_fast_exact(aa,L,currentTeam,i0,true);
%top5 = topfive(score);
%display 'Using TEAMREP-FAST-EXACT, the top five candidates are:';
%fprintf('%s \n', authorDict{top5});


%score = label_fast_approx(aa,L,currentTeam,i0,true,2);
%top5 = topfive(score);
%display 'Using TEAMREP-FAST-APPROX, the top five candidates are:';
%fprintf('%s \n', authorDict{top5});