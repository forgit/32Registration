ccc
load mri; D=squeeze(D); Im=normrange(single(D)); clear map siz D; 

Is=proj(Im);
Is=circshift(Is,[-15,15]);

x=[0 0 0 0 0 0];

optim=struct('GradObj','on','Display','iter','HessUpdate','lbfgs');
x=fminlbfgs(@(x)cost(x,Im,Is),x,optim);            

Ir=a3d(x,Im);

imgs(Is,proj(Ir))