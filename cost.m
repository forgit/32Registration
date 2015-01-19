function [e, egrad] = cost(x,Im,Is)

Ir=a3d(x,Im);

e = ncc(proj(Ir),Is);

if(nargout>1)
    delta=1e-5;
    egrad=zeros(1,length(x));
    for i=1:length(x)
        x2=x; x2(i)=x(i)+delta;
        Ir=a3d(x2,Im);
        egrad(i)=(ncc(proj(Ir),Is)-e)/delta;
    end
end