function D = xExpandMatrix(A, DimRow, DimCol, padXTop,padXBottom,padYLeft,padYRight,padding)
% xExpandMatrix(A, DimX, DimY, padXTop,padXBottom,padYLeft,padYRight)
% D is A expanded DIMROW and DIMCOL times. Pads with PADDING at the periphery
% Xavier Trepat 2008

% Dimension of the final matrix before padding
FinalDimRow = DimRow*size(A,1);
FinalDimCol = DimCol*size(A,2);

% Expand the matrix
B=imresize(A,[FinalDimRow FinalDimCol]);

% pad top and bottom
sizeB=size(B);
padXTmat(1:padXTop,1:sizeB(2))=padding;
padXBmat(1:padXBottom,1:sizeB(2))=padding;
C=cat(1,padXTmat,B,padXBmat);

% pad left and right
sizeC=size(C);
padYLmat(1:sizeC(1),1:padYLeft)=padding;
padYRmat(1:sizeC(1),1:padYRight)=padding;
D=cat(2,padYLmat,C,padYRmat);
