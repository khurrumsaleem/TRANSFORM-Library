within TRANSFORM.Math;
function fillArray_1D_2ns
  "create a matrix from an array of values (i.e., fill(val[:],n,n2)) for 1 dimension"
  extends Modelica.Icons.Function;

  input Real val[:] "Array of values for use in fill";

  input Integer n "Array size (i.e., fill(val[i],n,n2))";

  input Integer n2 = 1 "Array size (i.e., fill(val[i],n,n2))";

  output Real y[n,n2,size(val, 1)] "Matrix";

protected
  Integer m=size(val, 1);

algorithm

  for i in 1:m loop
    y[:,:, i] := fill(val[i], n, n2);
  end for;

end fillArray_1D_2ns;
