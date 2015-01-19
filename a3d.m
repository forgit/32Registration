function out = a3d(p,Imoving)

%M=make_transformation_matrix(x(1:3),x(4:6),x(7:9),x(10:15));
M=make_transformation_matrix(p(1:3),p(4:6));

%out=affine_transform(Im,M);

% Make center of the image transformation coordinates 0,0
[x,y,z]=ndgrid(0:(size(Imoving,1)-1),0:(size(Imoving,2)-1),0:(size(Imoving,3)-1));
xd=x-(size(Imoving,1)/2); yd=y-(size(Imoving,2)/2);  zd=z-(size(Imoving,3)/2);

% Calculate the backwards transformation fields
Bx = ((size(Imoving,1)/2) + M(1,1) * xd + M(1,2) *yd + M(1,3) *zd + M(1,4)* 1)-x;
By = ((size(Imoving,2)/2) + M(2,1) * xd + M(2,2) *yd + M(2,3) *zd + M(2,4)* 1)-y;
Bz = ((size(Imoving,3)/2) + M(3,1) * xd + M(3,2) *yd + M(3,3) *zd + M(3,4)* 1)-z;

out=movepixels(Imoving,Bx,By,Bz,3);