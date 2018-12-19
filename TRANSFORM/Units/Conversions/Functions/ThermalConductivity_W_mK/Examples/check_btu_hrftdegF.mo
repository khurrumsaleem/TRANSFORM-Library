within TRANSFORM.Units.Conversions.Functions.ThermalConductivity_W_mK.Examples;
model check_btu_hrftdegF

  extends TRANSFORM.Icons.Example;

  parameter SI.Length u=1;

  final parameter Real x_reference[unitTests.n]={0.58,1/0.58};

  Real x[unitTests.n];

  Utilities.ErrorAnalysis.UnitTests unitTests(n=2,x=x, x_reference=x_reference)
    annotation (Placement(transformation(extent={{80,80},{100,100}})));
equation

  x[1] = to_btu_hrftdegF(u);
  x[2] = from_btu_hrftdegF(u);

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end check_btu_hrftdegF;
