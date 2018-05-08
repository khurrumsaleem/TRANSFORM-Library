within TRANSFORM.Media.Fluids.Examples;
model LinearKClMGCl2_67_33_pT

  extends TRANSFORM.Icons.Example;

  parameter Integer n = 3;
  parameter SI.Temperature[n] Ts = {800,1050,1300};
  parameter SI.Pressure[n] ps = fill(1e5,3);

  replaceable package Medium =
      TRANSFORM.Media.Fluids.KClMgCl2.LinearKClMgCl2_67_33_pT;

  Medium.BaseProperties mediums[n];

  SI.DynamicViscosity eta[n] = Medium.dynamicViscosity(mediums.state);
  SI.ThermalConductivity lambda[n] = Medium.thermalConductivity(mediums.state);

  SI.Density d_T[n] = TRANSFORM.Media.Fluids.KClMgCl2.Utilities_67_33.d_T(Ts);

  TRANSFORM.Utilities.ErrorAnalysis.UnitTests unitTests(
    n=3,
    x=cat(1, mediums.d),
    x_reference=cat(1, d_T))
    annotation (Placement(transformation(extent={{80,80},{100,100}})));
equation
  mediums.p = ps;
  mediums.T = Ts;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end LinearKClMGCl2_67_33_pT;
