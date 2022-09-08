*primeira letra a

set i restricoes /1,2,3/
    J variaveis col var / 1,2/;

parameters c(j) coef da fo /1  5, 2  3/
            b(i) limite rest /1 12,2 10, 3  4/;
            
table a(i,j) coef das rest
   1 2
1  4 2
2  4 1
3  1 1 ;

positive variable x(j) incog:
variable z total fo;

Equation
FO fo
rest(i) restricao;

FO..  sum(j, c(j) *x(j)) =e= z;
rest(i)..sum(j,  a(i,j)*x(j)) =l= b(i);

model umAA /all/;

solve umAA using LP maximizing z;
