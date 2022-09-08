Set i oferta/stl, hou, den/
    j demanda /chi, ny, atl, la/;
    

parameters S(i) oferta / stl 200, hou 300, den 500 /
           D(j) demanda / chi 300, ny 200, atl 150, la 250/;
           

Table DIST(i,j) distância entre oferta e demanda em milhas
      chi      ny       atl     la
stl   3.1      8.2      6.5    10.4
hou   6.3      11.2     4.8     8.9
den   7.5      13.4     10.1    6.5 ;


Scalar freight custo por unidade por milha e por tonelada /2.1/;

Parameter COST(i,j) custo por unidade de envio;
COST(i,j) = DIST(i,j)*freight;



Variables   TCOST custo total de transporte;

Positive Variable SHIP(i,j) montante de shipped de oferta S(i) para demanda D(j) ;

Equation OBJ função objetivo
         SUPPLY(i) restriçao de oferta
         DEMAND(j) restriçao de demanda;
         
OBJ.. TCOST =E= sum(i, sum(j, COST(i,j) * SHIP(i,j)));

SUPPLY(i).. sum(j, SHIP(i,j)) =l= S(i) ;
DEMAND(j).. sum(i, SHIP(i,j)) =g= D(j);


Model  transp /all/;

solve transp using lp minimising TCOST
