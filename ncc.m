function e = ncc(V,U)

Vvar=V(:)-mean(V(:)); Uvar=U(:)-mean(U(:)); 
e=sum(Vvar.*Uvar)/((sqrt(sum(Vvar.^2))*sqrt(sum(Uvar.^2)))+eps);
e=1-e;
