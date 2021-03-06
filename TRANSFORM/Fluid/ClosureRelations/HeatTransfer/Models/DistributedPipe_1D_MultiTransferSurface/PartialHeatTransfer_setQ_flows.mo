within TRANSFORM.Fluid.ClosureRelations.HeatTransfer.Models.DistributedPipe_1D_MultiTransferSurface;
partial model PartialHeatTransfer_setQ_flows

  extends PartialHeatTransfer_setT(final flagIdeal=0);

  import Modelica.Constants.sigma;

  parameter Boolean use_RadHT=false "=true to turn on radiative heat transfer"
    annotation (Evaluate=true);
  input SI.Emissivity epsilon=1 "Emissivity"
    annotation (Dialog(group="Inputs", enable=use_RadHT));
  input SI.Emissivity epsilons[nHT,nSurfaces]=fill(
      epsilon,
      nHT,
      nSurfaces) "if non-uniform then set"
    annotation (Dialog(group="Inputs", enable=use_RadHT));

  //SI.ThermalResistance R[nHT,nSurfaces] "Radiative heat resistance";
  SI.HeatFlowRate Q_flows_radHT[nHT,nSurfaces]
    "Radiation heat transfer flow rate";
  SI.HeatFlowRate Qs_add[nHT,nSurfaces]=zeros(nHT, nSurfaces)
    "Additional sources of heat transfer";

equation

  //R = 1/(surfaceArea*sigma*epsilon*(port_a.T^2+port_b.T^2)*(port_a.T + port_b.T));
  //port_a.Q_flow = (port_a.T - port_b.T)/R;

  if use_RadHT then
    for i in 1:nHT loop
      for j in 1:nSurfaces loop
        Q_flows_radHT[i, j] = (Ts_wall[i, j] - Ts_fluid[i])*(surfaceAreas[i, j]
          *sigma*epsilons[i, j]*(Ts_wall[i, j]^2 - Ts_fluid[i]^2)*(Ts_wall[i, j]
           - Ts_fluid[i]));
      end for;
    end for;
  else
    Q_flows_radHT = zeros(nHT, nSurfaces);
  end if;

  for i in 1:nHT loop
    for j in 1:nSurfaces loop
      Q_flows[i, j] = CFs[i, j]*alphas[i, j]*surfaceAreas[i, j]*(Ts_wall[i, j]
         - Ts_fluid[i]) + Qs_add[i, j] + Q_flows_radHT[i, j];
    end for;
  end for;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end PartialHeatTransfer_setQ_flows;
